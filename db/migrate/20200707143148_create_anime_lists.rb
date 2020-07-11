class CreateAnimeLists < ActiveRecord::Migration
  def change
    create_table :anime_lists do |t|
      t.string :name
      t.string :type
      t.string :genre
      t.timestamps null: false
    end
  end
end
