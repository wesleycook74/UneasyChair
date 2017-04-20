class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.date :date
      t.string :reviewer
      t.integer :score
      t.string :rebuttle
      t.integer :confidence

      t.timestamps
    end
  end
end
