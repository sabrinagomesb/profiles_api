class ChangeColumnToNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :studies, :start_date, :date, null: true
  end
end
