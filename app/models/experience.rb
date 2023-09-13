class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, :company_name, :start_date, :function_performed, presence: true
  validates :title, :company_name, length: { maximum: 255 }
  validates :function_performed, length: { maximum: 500 }
end
