class Study < ApplicationRecord
  belongs_to :profile, inverse_of: :studies

  validates :profile_id, presence: true
  validates :title, presence: true
  validates :title, length: { maximum: 255 }
  validates :start_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/, message: 'must be in the format YYYY-MM-DD' }, allow_blank: true
  validates :end_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/, message: 'must be in the format YYYY-MM-DD' }, allow_blank: true
end
