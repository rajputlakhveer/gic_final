class CreateTripFrames < ActiveRecord::Migration[8.0]
  def change
    create_table :trip_frames do |t|
      t.string :location

      t.timestamps
    end
  end
end
