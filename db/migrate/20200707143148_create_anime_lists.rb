class CreateAnimeLists < ActiveRecord::Migration
  def change
    create_table :animelist do |t|
      t.string :name
      t.string :type
      t.string :genre
    end
  end
end
