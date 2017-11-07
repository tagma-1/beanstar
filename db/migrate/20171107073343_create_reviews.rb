class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
