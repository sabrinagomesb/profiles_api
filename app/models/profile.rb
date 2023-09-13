# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :studies, dependent: :destroy, inverse_of: :profile

  has_many :profile_abilities, dependent: :destroy
  has_many :abilities, through: :profile_abilities

  has_many :profile_techs, dependent: :destroy
  has_many :techs, through: :profile_techs

  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :studies, allow_destroy: true

  validates :name, :email, :birthdate, :phone, presence: true

  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :phone, length: { is: 11 }

  validates :phone, format: { with: /\A\d+\z/, message: 'must contain only numbers' }

  validates :role, inclusion: { in: %w[frontend backend fullstack mobile designer qa] }

  enum :role, {
    frontend: 'frontend',
    backend: 'backend',
    fullstack: 'fullstack',
    mobile: 'mobile',
    designer: 'designer',
    qa: 'qa'
  }
end
