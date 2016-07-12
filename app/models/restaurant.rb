class Restaurant < ApplicationRecord
  has_and_belongs_to_many :subcategories

  validates_uniqueness_of :restaurant_id
end
