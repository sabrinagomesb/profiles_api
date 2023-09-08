class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :phone, limit: 11
      t.string :links, array: true, default: []
      t.string :role

      t.timestamps
    end
  end
end
