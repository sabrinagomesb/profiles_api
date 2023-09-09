class ProfileAbility < ApplicationRecord
  belongs_to :profile
  belongs_to :ability

  validates :profile, :ability, presence: true
  validates :profile, uniqueness: { scope: :ability }
  validates :ability, inclusion: { in: %w[frontend backend fullstack mobile designer qa] }

  enum :type, {
    frontend: 1,
    backend: 2,
    fullstack: 3,
    mobile: 4,
    designer: 5,
    qa: 6
  }
end
