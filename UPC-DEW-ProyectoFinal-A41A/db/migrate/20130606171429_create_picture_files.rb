class CreatePictureFiles < ActiveRecord::Migration
  def change
    create_table :picture_files do |t|

      t.timestamps
    end
  end
end
