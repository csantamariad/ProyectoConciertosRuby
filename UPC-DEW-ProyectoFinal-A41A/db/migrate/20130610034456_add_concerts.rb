class AddConcerts < ActiveRecord::Migration
  def change
    add_column :concerts , 'estate' , :string  , :default => 'INA'
  end


end
