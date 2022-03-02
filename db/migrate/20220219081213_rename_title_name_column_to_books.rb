class RenameTitleNameColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :title_name, :title
  end
end
