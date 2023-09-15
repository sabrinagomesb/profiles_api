class AddLinkToStudy < ActiveRecord::Migration[7.0]
  def change
    add_column :studies, :link, :string, limit: 255, null: true
    add_column :studies, :institution, :string, limit: 255
  end
end
