class Category < ApplicationRecord
  has_many :subcategories
  translates :name

end
