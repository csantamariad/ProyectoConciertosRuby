class AddLocals < ActiveRecord::Migration
  def change
    add_column :locals , 'estate' , :string , :default => 'INA'
  end


end
