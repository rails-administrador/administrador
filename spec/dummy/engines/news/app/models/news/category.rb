module News
  class Category < ApplicationRecord
    has_many :items
  end
end
