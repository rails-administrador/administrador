module Blorgh
  class Post < ActiveRecord::Base
    # Add attributes that the factory expects
    attr_accessor :title, :body, :published_at
  end
end