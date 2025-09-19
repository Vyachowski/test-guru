class CreateGists < ActiveRecord::Migration[7.2]
  def change
    create_table :gists do |t|
      t.string :question
      t.text :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
