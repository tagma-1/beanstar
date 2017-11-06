class AddPickupToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :pickup, :boolean
    add_column :purchases, :address, :string
  end
end
