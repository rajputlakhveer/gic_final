class CreateRecognition < ActiveRecord::Migration[8.0]
  def change
    create_table :recognitions do |t|
      t.string :title

      t.timestamps
    end
  end
end
