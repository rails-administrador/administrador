module Administrador
  class OffcanvasViewHelper < Rao::ViewHelper::Base
    def offcanvas(id, options = {})
      c.render partial: 'offcanvas_view_helper/offcanvas', locals: { id: id, options: options }
    end
  end
end
