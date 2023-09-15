class CreateProfileSoftskills < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_softskills do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :softskill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
