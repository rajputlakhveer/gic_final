class CreateItineraries < ActiveRecord::Migration[8.0]
  def change
    create_table :itineraries do |t|
      t.integer :day
      t.references :upcoming_trip, null: false, foreign_key: true
      t.datetime :date
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
