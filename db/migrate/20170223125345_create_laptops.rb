class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :product_name
      t.decimal :price, precision: 12, scale: 2
      t.string :origin
      t.datetime :from
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
