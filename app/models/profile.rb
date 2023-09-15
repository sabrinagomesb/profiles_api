# frozen_string_literal: true
require 'prawn'

class Profile < ApplicationRecord
  belongs_to :city

  has_many :experiences, dependent: :destroy
  has_many :studies, dependent: :destroy, inverse_of: :profile

  has_many :profile_abilities, dependent: :destroy
  has_many :abilities, through: :profile_abilities

  has_many :profile_softskills, dependent: :destroy
  has_many :softskills, through: :profile_softskills

  has_many :profile_techs, dependent: :destroy
  has_many :techs, through: :profile_techs

  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :studies, allow_destroy: true

  validates :name, :email, :birthdate, :phone, :bio, presence: true

  validates :name, length: { minimum: 4 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :birthdate, format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/, message: 'must be in the format YYYY-MM-DD' }
  validates :phone, length: { is: 11 }
  validates :phone, format: { with: /\A\d+\z/, message: 'must contain only numbers' }
  validates :role, inclusion: { in: :role }
  validates :bio, length: { minimum: 50 }

  enum :role, {
    frontend: 'frontend',
    backend: 'backend',
    fullstack: 'fullstack',
    mobile: 'mobile',
    designer: 'designer',
    qa: 'qa'
  }

  def to_pdf
    name = self.name
    email = self.email
    birthdate = self.birthdate
    phone = self.phone
    links = self.links
    role = self.role
    bio = self.bio

    pdf = Prawn::Document.new(page_size: 'A4', page_layout: :portrait) do
      text "Name: #{name}"
      text "Email: #{email}"
      text "Birthdate: #{birthdate}"
      text "Phone: #{phone}"
      text "Links: #{links}"
      move_down 5
      text "Role: #{role}"
      text "Bio: #{bio}"
      move_down 10
      text 'Experiences:', style: :bold
      # experiences.each do |experience|
      #   text "Title: #{experience.title}"
      #   text "Company: #{experience.company_name}"
      #   text "Start date: #{experience.start_date}"
      #   text "End date: #{experience.end_date}"
      #   text "Function performed: #{experience.function_performed}"
      #   move_down 5
      # end
      move_down 10
      text 'Studies:', style: :bold
      # studies.each do |study|
      #   text "Title: #{study.title}"
      #   text "Start date: #{study.start_date}"
      #   text "End date: #{study.end_date}"
      #   move_down 5
      # end
    end
    pdf.render
  end
end
