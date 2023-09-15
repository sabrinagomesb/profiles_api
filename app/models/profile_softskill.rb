class ProfileSoftskill < ApplicationRecord
  belongs_to :profile
  belongs_to :softskill

  validates :profile, :softskill, presence: true
  validates :profile, uniqueness: { scope: :softskill }
end
