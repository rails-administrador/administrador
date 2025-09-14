module News
  class Category < ActiveRecord::Base
    has_many :items
    
    # Add attributes that the factory expects
    attr_accessor :identifier
  end
end
