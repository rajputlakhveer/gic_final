class CreateHomes < ActiveRecord::Migration[8.0]
  def change
    create_table :homes do |t|
      t.integer :position
      t.string :title
      t.string :subtitle
      t.integer :slide_category, default: 0

      t.timestamps
    end
  end
end
