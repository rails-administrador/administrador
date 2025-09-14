module News
  class Item < ActiveRecord::Base
    belongs_to :category
    
    # Add attributes that the factory expects
    attr_accessor :title, :body, :published_at
  end
end
