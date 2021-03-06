class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :condition
      t.integer :year_made
      t.integer :number_available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
