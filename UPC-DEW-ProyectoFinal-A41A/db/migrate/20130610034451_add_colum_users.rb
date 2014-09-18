class AddColumUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :boolean , :default => false #you can change the name, see wiki
  end
end
