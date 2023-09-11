class AddDescriptionToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :description, :text, after: :role
  end
end
