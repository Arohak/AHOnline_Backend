class Category < ApplicationRecord
  has_and_belongs_to_many :restaurants
  # has_many :shops

  validates_uniqueness_of :category_id
end
