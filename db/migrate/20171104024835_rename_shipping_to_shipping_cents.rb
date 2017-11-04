class RenameShippingToShippingCents < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :shipping, :shipping_cents
  end
end
