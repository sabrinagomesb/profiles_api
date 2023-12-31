class Study < ApplicationRecord
  belongs_to :profile, inverse_of: :studies

  validates :title, :institution, presence: true
  validates :title, length: { maximum: 255 }
  validates :institution, length: { minimum: 4, maximum: 255 }
  validates :start_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/,
                                   message: 'must be in the format YYYY-MM-DD' }
  validates :end_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/,
                                 message: 'must be in the format YYYY-MM-DD' }, allow_blank: true
end
