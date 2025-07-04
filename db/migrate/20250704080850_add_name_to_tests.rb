class AddNameToTests < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :name, :string, null: false
    add_column :tests, :creator_id, :bigint, null: false
    add_foreign_key :tests, :users, column: :creator_id
  end
end
