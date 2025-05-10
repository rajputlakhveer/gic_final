class CreateTripItems < ActiveRecord::Migration[8.0]
  def change
    create_table :trip_items do |t|
      t.string :title, null: false
      t.text :description
      t.integer :category, null: false
      t.references :upcoming_trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
