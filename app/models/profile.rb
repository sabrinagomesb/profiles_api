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

  enum :role_options, {
    frontend: 'frontend',
    backend: 'backend',
    fullstack: 'fullstack',
    mobile: 'mobile',
    designer: 'designer',
    qa: 'qa'
  }

  validates :name, :email, :birthdate, :phone, :role, :bio, presence: true

  validates :name, length: { minimum: 4 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :birthdate,
            format: { with: /\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])\z/,
                      message: 'must be in the format YYYY-MM-DD' }
  validates :phone, length: { is: 11 }
  validates :phone, format: { with: /\A\d+\z/, message: 'must contain only numbers' }
  validates :bio, length: { minimum: 50 }

  validate :validate_role
  validate :validate_softskills
  validate :validate_techs
  validate :validate_abilities

  def validate_role
    role = self.role

    if !Profile.role_options.key?(role)
      errors.add(:role, 'must be a valid role')
    end
  end

  def validate_softskills
    softskills = self.softskills

    if softskills.empty? || softskills.size != 3
      errors.add(:softskills, 'must have 3 softskills')
    end
  end

  def validate_techs
    techs = self.techs
    if techs.empty?
      errors.add(:techs, 'must have at least 1 tech')
    end
  end

  def validate_abilities
    abilities = self.abilities

    if abilities.empty?
      errors.add(:abilities, 'must have at least 1 ability')
    end

    abilities.each do |ability|
      if self.role.nil?
        errors.add(:abilities, 'must have role to validate abilities')
      end

      if ability.role != self.role
        errors.add(:abilities, 'must have abilities according to the role')
      end
    end
  end

  def to_pdf
    name = self.name
    email = self.email
    birthdate = self.birthdate
    phone = self.phone
    links = self.links
    role = self.role
    bio = self.bio
    experiences = self.experiences
    studies = self.studies
    city = self.city.name
    state = self.city.state.name
    abilities = self.abilities
    techs = self.techs
    softskills = self.softskills

    p links

    pdf = Prawn::Document.new(
      page_size: 'A4',
      page_layout: :portrait,
      margin: [50, 40, 40, 40]
    ) do
      default_leading 6
      text "PROFILE - #{role.upcase} ", size: 24, style: :bold, leading: 0
      text name.upcase.to_s, size: 18, style: :bold
      stroke_horizontal_rule
      move_down 15

      bounding_box([bounds.left, cursor], width: bounds.width) do
        text bio, style: :italic, align: :center
      end

      column_box([0, cursor], columns: 2, width: bounds.width) do
        text "<b>EMAIL</b>: #{email}", inline_format: true
        move_up 20
        bounding_box([bounds.right - 50, cursor], width: 300) do
          text "<b>TELEFONE</b>: #{phone}", inline_format: true, align: :right
        end
        text "<b>DATA DE NASCIMENTO</b>: #{birthdate}", inline_format: true
        text "<b>CIDADE</b>: #{city} - #{state}", inline_format: true
      end

      if links.present?
        text 'LINKS:', style: :bold
        links.each do |link|
          text "• #{link}"
        end
      end

      move_down 10
      text 'EXPERIÊNCIAS:', size: 18, style: :bold
      if experiences.empty?
        text ' •  Ainda em busca da minha primeira experiência.', style: :italic
      end
      experiences.each do |experience|
        text experience.title, size: 14, style: :bold
        text "Empresa: #{experience.company_name}"
        text "Data Inicio: #{experience.start_date}"
        if experience.end_date.present?
          text "Data Fim: #{experience.end_date}"
        else
          text ' •  Está é minha experiência atual', style: :italic
        end
        text "Função: #{experience.function_performed}"
        move_down 5
      end
      move_down 10

      text 'ESTUDOS:', size: 18, style: :bold
      if studies.empty?
        text ' •  No momento sem estudos para cadastro.', style: :italic
      end
      studies.each do |study|
        text study.title, style: :bold
        text "Instituição: #{study.institution}"
        text "Link: #{study.link}"
        text "Data Inicio: #{study.start_date}"
        if study.end_date.present?
          text "Data Fim: #{study.end_date}"
        else
          text ' •  Em andamento.', style: :italic
        end
      end
      move_down 10

      # start new page if the content is bigger than the page
      start_new_page if cursor < 50

      text 'HABILIDADES:', size: 18, style: :bold
      abilities.each do |ability|
        text "• #{ability.name};"
      end
      move_down 10
      text 'TECNOLOGIAS:', size: 18, style: :bold
      techs.each do |tech|
        text "• #{tech.name};"
      end
      move_down 10
      text 'SOFTSKILLS:', size: 18, style: :bold
      softskills.each do |softskill|
        text "• #{softskill.name};"
      end
    end
    pdf.render
  end
end
