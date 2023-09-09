class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.string :name, null: false, index: { unique: true }, limit: 255
      t.string :type

      t.timestamps
    end
  end
end
