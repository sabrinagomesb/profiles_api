class ProfileTech < ApplicationRecord
  belongs_to :profile
  belongs_to :tech

  validates :profile, :tech, presence: true
  validates :profile, uniqueness: { scope: :tech }

end
