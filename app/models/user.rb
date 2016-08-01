class User < ApplicationRecord
  validates_uniqueness_of :mobile_number
  # validates :mobile_number, phone: { possible: false, allow_blank: true, types: [:mobile] }

end
