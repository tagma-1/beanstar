class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :store, foreign_key: true
      t.string :title
      t.string :variety
      t.string :country
      t.string :region
      t.string :producer
      t.string :notes
      t.string :roast
      t.boolean :grind
      t.integer :weight
      t.date :roast_date
      t.text :about
      t.integer :price
      t.integer :shipping
      t.text :product_image_data

      t.timestamps
    end
  end
end
