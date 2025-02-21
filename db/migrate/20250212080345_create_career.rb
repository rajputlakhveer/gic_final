class CreateCareer < ActiveRecord::Migration[8.0]
  def change
    create_table :careers do |t|
      t.string :role
      t.text :description
      t.integer :job_type

      t.timestamps
    end
  end
end
