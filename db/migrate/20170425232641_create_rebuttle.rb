class CreateRebuttle < ActiveRecord::Migration[5.0]
  def change
    create_table :rebuttles do |t|
      t.string :authorRebuttle
      t.references :review, foreign_key: true
    end
  end
end
