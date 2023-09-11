class ProfileAbility < ApplicationRecord
  belongs_to :profile
  belongs_to :ability

  validates :profile, :ability, presence: true
  validates :profile, uniqueness: { scope: :ability }
end
