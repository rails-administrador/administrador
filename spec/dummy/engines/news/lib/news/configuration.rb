module News
  module Configuration        
    def configure
      yield self
    end

    mattr_accessor :registered_controllers do
      lambda do
        [
          News::PostsController
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
