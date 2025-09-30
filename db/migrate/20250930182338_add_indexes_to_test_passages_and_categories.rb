class AddIndexesToTestPassagesAndCategories < ActiveRecord::Migration[7.2]
  def change
    add_index :test_passages, [:user_id, :test_id]
    add_index :categories, :title, unique: true
  end
end
