class AddRebuttleColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :rebuttles, :reviewID, :review_ID
  end
end
