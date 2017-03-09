class RenameDocUrlToAttachment < ActiveRecord::Migration[5.0]
  def change
    rename_column :papers, :doc_url, :attachment
  end
end
