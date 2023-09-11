class Ability < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, length: { maximum: 255 }

  validates :role, inclusion: { in: Profile.roles.values }
end
