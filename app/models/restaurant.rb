class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories

  validates_uniqueness_of :restaurant_id
end
