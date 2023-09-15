class CreateSoftskills < ActiveRecord::Migration[7.0]
  def change
    create_table :softskills do |t|
      t.string :name, null: false, limit: 255

      t.timestamps
    end
  end
end
