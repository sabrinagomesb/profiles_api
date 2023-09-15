class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, :company_name, :start_date, :function_performed, presence: true
  validates :title, :company_name, length: { maximum: 255 }
  validates :start_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/, message: 'must be in the format YYYY-MM-DD' }
  validates :end_date, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/, message: 'must be in the format YYYY-MM-DD' }, allow_blank: true
  validates :function_performed, length: { maximum: 500 }

  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    return unless start_date && end_date

    errors.add(:start_date, "can't be greater than end date") if start_date > end_date
  end
end
