module Blorgh
  class PostsController < Administrador::ResourcesController::Base

    def self.resource_class
      Blorgh::Post
    end

    private

    def permitted_params
      params.require(:post).permit(:title, :body, :published_at)
    end
  end
end