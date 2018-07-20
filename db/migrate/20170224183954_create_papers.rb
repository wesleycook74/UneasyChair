class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :doc_url
      t.string :author

      t.boolean :accepted

      t.timestamps
    end
  end
end
