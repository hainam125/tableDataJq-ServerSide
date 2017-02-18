class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :day_of_birth
      t.datetime :place_of_birth
      t.decimal :salary, precision: 10, scale: 2
      t.integer :experience
      t.boolean :onsite, default: false

      t.timestamps null: false
    end
  end
end
