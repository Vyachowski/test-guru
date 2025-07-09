class CreateTestPassages < ActiveRecord::Migration[7.2]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :passed, default: false, null: false

      t.timestamps
    end
  end
end
