class Fixfile < ActiveRecord::Migration[5.0]
  def change
    change_column :papers, :doc_url, :string
  end
end
