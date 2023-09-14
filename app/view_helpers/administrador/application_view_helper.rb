module Administrador
  class ApplicationViewHelper < Rao::ViewHelper::Base
    def registered_engines
      Administrador::RegisteredEngine.all
    end

    def filter_attributes_for_form(attribute_names)
      attribute_names.reject { |an| %w(id created_at updated_at).include?(an) }
    end

    def filter_attributes_for_show(attribute_names)
      attribute_names.reject { |an| %w().include?(an) }
    end

    def flash_messages
      c.render partial: 'administrador/application_view_helper/flash_messages', locals: { flash: bootstrapify_flash_keys(c.flash) }
    end

    def label_for(resource)
      Administrador::Configuration.resource_label_methods.each do |method_name|
        next unless resource.respond_to?(method_name)
        return resource.send(method_name)
      end
    end

    def render_engine_sidebars
      registered_engines.collect do |registered_engine|
        c.render partial: 'administrador/application_view_helper/render_engine_sidebars', locals: { engine: registered_engine }
      end.join.html_safe
    end

    def body_html
      css_classes = ['administrador', 'd-flex flex-column h-100', c.controller.class.name.underscore.gsub('/', '-').chomp('_controller'), c.action_name].compact.join(' ')
      { class: css_classes, "data-turbo": "false" }
    end

    def render_registered_engine_widget(registered_engine)
      render registered_engine: registered_engine
    end

    private

    def bootstrapify_flash_keys(flash)
      flash.each_with_object({}) do |(key, value), memo|
        memo[map_message_type_to_context(key)] = value
      end
    end

    def map_message_type_to_context(message_type)
      { success: "success", error: "danger", alert: "warning", notice: "info" }[message_type.to_sym] || message_type.to_s
    end
  end
end
