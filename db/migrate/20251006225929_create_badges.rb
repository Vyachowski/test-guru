class CreateBadges < ActiveRecord::Migration[7.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :rule_type, null: false
      t.string :rule_value
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :badges, :active
    add_index :badges, :rule_type
  end
end
