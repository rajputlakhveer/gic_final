class CreateUpcomingTrips < ActiveRecord::Migration[8.0]
  def change
    create_table :upcoming_trips do |t|
      t.string :title
      t.text :description
      t.boolean :offbeat_trip
      t.boolean :festival_trip
      t.boolean :group_trip
      t.boolean :customise_trip
      t.boolean :corporate_trip 
      t.integer :status
      t.string :book_now_url
      t.integer :number_of_days
      t.string :start_location
      t.string :end_location
      t.integer :price

      t.timestamps
    end
  end
end
