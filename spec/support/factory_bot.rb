require 'factory_bot_rails'

FactoryBot.definition_file_paths << News::Engine.root.join('spec', 'factories')
FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end