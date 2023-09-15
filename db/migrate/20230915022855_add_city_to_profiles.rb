class AddCityToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :city, null: false, foreign_key: true
  end
end
