class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.integer :level, null: false, default: 1
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
