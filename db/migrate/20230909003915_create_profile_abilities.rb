class CreateProfileAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_abilities do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
