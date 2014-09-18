class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
      t.text :description
      t.string :district
      t.string :address
      t.string :geolocation
      t.string :phone
      t.string :pictureref

      t.timestamps
    end
  end
end
