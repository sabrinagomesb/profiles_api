class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.string :title, null: false, limit: 255
      t.date :start_date, null: false
      t.date :end_date
      t.references :profile, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
