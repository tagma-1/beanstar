class CreateJoinTableFollowing < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :stores, table_name: :following do |t|
      t.index [:user_id, :store_id]
      t.index [:store_id, :user_id]
    end
  end
end
