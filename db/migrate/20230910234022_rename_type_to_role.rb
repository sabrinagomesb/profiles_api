class RenameTypeToRole < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :type, :role
  end
end
