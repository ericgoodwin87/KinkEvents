class RenameTitleToNameInEvents < ActiveRecord::Migration[8.0]
  def change
    rename_column :events, :title, :name
  end
end