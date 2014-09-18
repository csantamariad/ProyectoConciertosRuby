class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :givenname
      t.string :lastname1
      t.string :lastname2
      t.string :documentnumber
      t.string :documenttype
      t.string :gender
      t.string :email
      t.string :password
      t.string :pictureref
      t.references :user_type

      t.timestamps
    end
    add_index :users, :user_type_id
  end
end
