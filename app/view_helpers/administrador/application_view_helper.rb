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

    def resource_title_for_show(resource)
      %i(administrador_title human title name to_s).each do |method_name|
        return resource.send(method_name) if resource.respond_to?(method_name)
      end
    end
  end
end
