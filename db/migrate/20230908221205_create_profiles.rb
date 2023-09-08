class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false, limit: 255
      t.string :email, null: false, limit: 255
      t.date :birthdate, null: false
      t.string :phone, null:false, limit: 11
      t.string :links, array: true, default: []
      t.string :role

      t.timestamps
    end
  end
end
