class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.string :charge_identifier

      t.timestamps
    end
  end
end
