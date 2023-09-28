class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.string :condition
      t.string :shipping_fee
      t.string :shipping_region
      t.string :shipping_duration

      t.timestamps
    end
  end
end

