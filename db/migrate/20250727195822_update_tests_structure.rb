class UpdateTestsStructure < ActiveRecord::Migration[7.2]
  def change
    rename_column :tests, :name, :title

    change_column_default :tests, :level, from: 1, to: 0
  end
end
