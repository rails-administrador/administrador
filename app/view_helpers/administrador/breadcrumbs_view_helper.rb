module Administrador
  class BreadcrumbsViewHelper < Rao::ViewHelper::Base
    def render
      c.render partial: 'breadcrumbs/render', locals: { breadcrumbs: generate_breadcrumbs! }
    end

    private

    def t(identifier, options = {})
      if identifier.start_with?('.')
        prefix = self.class.name.underscore
        caller_method = caller[0].split(' ').last.gsub("'", '')
        I18n.t("#{prefix}.#{caller_method}.#{identifier}", *options)
      else
        I18n.t(identifier, *options)
      end
    end

    def url_for?(*routable)
      begin
        c.url_for(*routable)
        true
      rescue ActionController::UrlGenerationError
        false
      end
    end

    def generate_breadcrumbs!
      [].tap do |breadcrumbs|
        # Add breadcrumb to home page
        breadcrumbs << { label: t('.home'), url: c.administrador.root_path, link_html_options: {}, li_html_options: {}}

        if c.respond_to?(:engine_class, true) && c.engine_class.present?
          engine = Administrador::Configuration.engines[c.engine_class.name]
          if engine.present?
            breadcrumbs << { label: t("classes.#{engine.engine.name.underscore}"), url: c.send(engine.router_name).root_path, link_html_options: {}, li_html_options: {} }
          end
        end

        # if c.respond_to?(:resource_class, true) && c.respond_to?(:available_rest_actions) && c.available_rest_actions.include?(:index)
        if c.respond_to?(:resource_class, true) && url_for?(action: :index)
          breadcrumbs << { label: c.resource_class.model_name.human(count: :other), url: c.url_for(action: :index), link_html_options: {}, li_html_options: {} }
        end

        if r = c.instance_variable_get(:@resource).presence
          if r.persisted?
            breadcrumbs << { label: c.administrador_helper(c).label_for(r), url: c.url_for(action: :show, id: r.to_param), link_html_options: {}, li_html_options: {} }
          end
        end

        # if respond_to?(:service_class, true)
        #   breadcrumbs << service_class.model_name.human
        # end

        action_namespace = c.respond_to?(:service_class, true) ? :service : :default

        if %w(new edit).include?(c.action_name) && url_for?(action: c.action_name)
          breadcrumbs << { label: t("controller.breadcrumbs_concern.actions.#{action_namespace}.#{c.action_name}"), url: { action: c.action_name }, link_html_options: {}, li_html_options: {} }
        end

        if %w(create update).include?(c.action_name)
          breadcrumbs << { label: t("controller.breadcrumbs_concern.actions.#{action_namespace}.#{c.action_name}"), url: '#', link_html_options: {}, li_html_options: {} }
        end

        if c.params[:page].present?
          breadcrumbs << { label: t('controller.breadcrumbs_concern.page', page_number: c.params[:page]), url: '#', link_html_options: {}, li_html_options: {} }
        end

        breadcrumbs.last[:li_html_options][:class] = 'active'
      end
    end
  end
end
