class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, :company_name, :start_date, :function_performed, presence: true
  validates :title, :company_name, length: { maximum: 255 }
  validates :function_performed, length: { maximum: 500 }

  # validates :start_date, :end_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'must be in the format YYYY-MM-DD' }
  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    return unless start_date && end_date

    errors.add(:start_date, "can't be greater than end date") if start_date > end_date
  end
end
