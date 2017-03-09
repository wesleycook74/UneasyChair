class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :papers, :doc_url, :binary
  end
end
