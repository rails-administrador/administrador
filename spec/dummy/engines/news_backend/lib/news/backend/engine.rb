module News
  module Backend
    class Engine < Rails::Engine
      isolate_namespace News::Backend
    end
  end
end