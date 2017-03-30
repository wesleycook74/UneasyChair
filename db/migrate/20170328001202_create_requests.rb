class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string :role

      t.timestamps
    end
  end
end
