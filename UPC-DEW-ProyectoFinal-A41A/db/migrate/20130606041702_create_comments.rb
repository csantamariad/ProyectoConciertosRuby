class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :ordinal
      t.integer :score
      t.references :user
      t.references :concert

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :concert_id
  end
end
