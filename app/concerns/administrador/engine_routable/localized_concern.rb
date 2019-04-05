module Administrador
  module EngineRoutable
    # This prevents missing method error when using localized
    # engines. The localized gem fails to create a default route
    # name for engines without a locale suffix. For example if you
    # have an engine named blorgh, the router should be named blorgh.
    # With localized you get blorgh_en, blorgh_de and so on. This concern
    # provides the router method without the locale as suffix.
    module LocalizedConcern
      def method_missing(m, *args, &block)
        method_name_with_locale = "#{m}_#{I18n.locale}"

        if respond_to?(method_name_with_locale)
          send(method_name_with_locale, *args, &block)
        else
          super
        end
      end
    end
  end
end