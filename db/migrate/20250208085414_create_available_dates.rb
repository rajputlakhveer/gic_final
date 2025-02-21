class CreateAvailableDates < ActiveRecord::Migration[8.0]
  def change
    create_table :available_dates do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :availability
      t.references :upcoming_trip

      t.timestamps
    end
  end
end
