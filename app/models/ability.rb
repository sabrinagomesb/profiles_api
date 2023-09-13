class Ability < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  validates :role, inclusion: { in: Profile.roles.values }

  after_commit :create_fullstack_ability

  private

  def create_fullstack_ability
    puts name
    Ability.find_or_create_by(name:, role: 'fullstack', description:)
  end
end
