class State < ApplicationRecord
  has_many :cities, dependent: :destroy, inverse_of: :state

  validates_associated :cities
  validates :name, :acronym, presence: true
  validates :name, length: { maximum: 255, too_long: '%<count>s characters is the maximum allowed length' }
  validates :acronym, length: { is: 2 }
  validates :name, :acronym, uniqueness: { case_sensitive: false }

  accepts_nested_attributes_for :cities, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

  before_validation :normalize_name
  before_create do
    self.acronym = acronym.upcase
  end

  private

  def normalize_name
    self.name = name.downcase.titleize if name.present?
  end
end
