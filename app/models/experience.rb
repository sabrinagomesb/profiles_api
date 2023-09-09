class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, :company_name, :start_date, :function_performed, presence: true
  validates :title, :company_name, length: { maximum: 255 }
  validates :function_performed, length: { maximum: 500 }
  validates :start_date, :end_date, date: true
  validates :end_date, date: { after_to: :start_date }, allow_blank: true

end
