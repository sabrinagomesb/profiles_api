class ChangeColumnToNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :studies, :institution, :string, null: false
  end
end
