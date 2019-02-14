module News
  class Item < ApplicationRecord
    belongs_to :category
  end
end
