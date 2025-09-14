module News
  class Engine < Rails::Engine
    isolate_namespace News

    initializer "news.factories", after: "factory_bot.set_factory_paths" do
      FactoryBot.definition_file_paths << root.join('spec', 'factories')
    end
  end
end