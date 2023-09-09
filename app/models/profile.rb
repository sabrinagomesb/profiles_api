# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :experiences, dependent: :destroy

  validates :name, :email, :birthdate, :phone, presence: true
  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :phone, length: { maximum: 11 }
  validates :role, inclusion: { in: %w[frontend backend fullstack mobile designer qa] }

  enum :role, {
    frontend: 1,
    backend: 2,
    fullstack: 3,
    mobile: 4,
    designer: 5,
    qa: 6
  }
end
