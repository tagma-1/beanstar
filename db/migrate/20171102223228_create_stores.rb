class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :image_data
      t.string :address
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.text :about
      t.text :roasting_schedule
      t.date :next_roast
      t.boolean :pickup

      t.timestamps
    end
  end
end
