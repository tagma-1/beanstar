class RenamePriceToPriceCents < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :price, :price_cents
  end
end
