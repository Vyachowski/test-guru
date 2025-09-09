class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string, default: nil
    add_column :users, :last_name, :string, default: nil
    add_column :users, :type, :string, null: false, default: 'User'
  end
end
