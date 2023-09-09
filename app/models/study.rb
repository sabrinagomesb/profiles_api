class Study < ApplicationRecord
  belongs_to :profile

  validates :profile_id, presence: true
  validates :title, :start_date, presence: true
  validates :title, length: { maximum: 255 }
  validates :start_date, :end_date, date: true
  validates :end_date, date: { after_or_equal_to: :start_date }

end
