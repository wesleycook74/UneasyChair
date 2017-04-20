class CreateRebuttleTable < ActiveRecord::Migration[5.0]
  def change
    create_table :rebuttles do |t|
      t.integer "review_ID"
      t.string  "authorRebuttle"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
