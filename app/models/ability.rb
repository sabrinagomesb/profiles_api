class Ability < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  validates :role, inclusion: { in: Profile.role_options.values }

  after_commit :create_fullstack_ability

  private

  def create_fullstack_ability
    puts "Add #{name} to fullstack role"
    Ability.find_or_create_by(name:, role: 'fullstack', description:) if role == 'frontend' || role == 'backend'
  end
end
