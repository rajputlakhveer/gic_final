class CreateTravellerStory < ActiveRecord::Migration[8.0]
  def change
    create_table :traveller_stories do |t|
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
