class Restaurant < ApplicationRecord
  has_and_belongs_to_many :subcategories
  has_many :categoryitems

  validates_uniqueness_of :restaurant_id
end
