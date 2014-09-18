class CreateConcertUsers < ActiveRecord::Migration
  def change
    create_table :concert_users do |t|
      t.integer :user_id
      t.integer :concert_id
      t.string :estate

      t.timestamps
    end
  end
end
