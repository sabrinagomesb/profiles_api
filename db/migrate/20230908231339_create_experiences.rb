class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title, null: false, limit: 255
      t.string :company_name, null: false, limit: 255
      t.date :start_date, null: false
      t.date :end_date
      t.text :function_performed, null: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
