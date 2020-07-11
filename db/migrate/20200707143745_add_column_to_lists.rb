class AddColumnToLists < ActiveRecord::Migration
  def change
    add_column :animelists, :user_id, :integer
  end
end
