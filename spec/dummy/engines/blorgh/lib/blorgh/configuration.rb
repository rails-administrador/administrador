module Blorgh
  module Configuration        
    def configure
      yield self
    end

    mattr_accessor :registered_controllers do
      lambda do
        [
          Blorgh::PostsController
        ]
      end
    end

    mattr_accessor :registered_services do
      lambda do
        []
      end
    end
  end
end
