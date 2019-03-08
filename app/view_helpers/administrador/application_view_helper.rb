module Administrador
  class ApplicationViewHelper < Rao::ViewHelper::Base
    def engines
      Administrador::Configuration.engines
    end

    def filter_attributes_for_form(attribute_names)
      attribute_names.reject { |an| %w(id created_at updated_at).include?(an) }
    end

    def filter_attributes_for_show(attribute_names)
      attribute_names.reject { |an| %w().include?(an) }
    end

    def resource_title(resource)
      %i(administrador_title human title name to_s).each do |method_name|
        return resource.send(method_name) if resource.respond_to?(method_name)
      end
    end

    def flash_messages
      c.render partial: 'administrador/application_view_helper/flash_messages', locals: { flash: bootstrapify_flash_keys(c.flash) }
    end

    def resource_label_for(resource)
      Administrador::Configuration.resource_label_methods.each do |method_name|
        next unless resource.respond_to?(method_name)
        return resource.send(method_name)
      end
    end

    def render_engine_sidebars
      engines.collect do |_, engine|
        c.render partial: 'administrador/application_view_helper/render_engine_sidebars', locals: { engine: engine }
      end.join.html_safe
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
