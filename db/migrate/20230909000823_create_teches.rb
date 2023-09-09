class CreateTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :teches do |t|
      t.string :name, null: false, index: { unique: true }, limit: 255

      t.timestamps
    end
  end
end
