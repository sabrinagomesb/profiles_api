class Tech < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :name, length: { maximum: 255 }

end
