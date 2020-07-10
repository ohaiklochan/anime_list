class AddColumnToLists < ActiveRecord::Migration
  def change
    add_column :animelist, :user_id, :integer
  end
end
