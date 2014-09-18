class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :genre
      t.text :biography
      t.string :pictureref

      t.timestamps
    end
  end
end
