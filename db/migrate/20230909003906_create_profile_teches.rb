class CreateProfileTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_teches do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :tech, null: false, foreign_key: true

      t.timestamps
    end
  end
end
