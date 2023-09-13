class Study < ApplicationRecord
  belongs_to :profile, inverse_of: :studies

  validates :profile_id, presence: true
  validates :title, :start_date, presence: true
  validates :title, length: { maximum: 255 }
end
