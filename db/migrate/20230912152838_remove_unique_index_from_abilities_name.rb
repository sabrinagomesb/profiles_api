class RemoveUniqueIndexFromAbilitiesName < ActiveRecord::Migration[7.0]
  def change
    remove_index :abilities, :name
  end
end
