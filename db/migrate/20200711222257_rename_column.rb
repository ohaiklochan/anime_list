class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :anime_lists, :type, :classification
  end
end
