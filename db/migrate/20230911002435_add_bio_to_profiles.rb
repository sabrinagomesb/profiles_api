class AddBioToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :bio, :text, null: false, after: :role
  end
end
