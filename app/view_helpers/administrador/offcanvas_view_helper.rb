module Administrador
  class OffcanvasViewHelper < Rao::ViewHelper::Base
    def offcanvas(id, options = {})
      on_open_url = options.delete(:load)
      c.render partial: 'offcanvas_view_helper/offcanvas', locals: { id: id, options: options, on_open_url: on_open_url }
    end
  end
end
