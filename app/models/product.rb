class Product < ApplicationRecord
  belongs_to :categoryitem

  def self.search(search)
    where("keywords LIKE ?", "%#{search}%")
  end

end