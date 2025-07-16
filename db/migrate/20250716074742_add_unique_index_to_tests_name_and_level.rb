class AddUniqueIndexToTestsNameAndLevel < ActiveRecord::Migration[7.2]
  def change
    add_index :tests, [ :name, :level ], unique: true
  end
end
