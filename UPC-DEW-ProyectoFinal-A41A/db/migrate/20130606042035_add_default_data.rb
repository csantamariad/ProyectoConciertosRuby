class AddDefaultData < ActiveRecord::Migration
  def up

    Local.create :name => "Studio Uno", :description => "Sala Simple 1", :district => "San Borja", :address => "av. San Boja", :geolocation => "", :phone => "999999", :pictureref => "default_local"
    Local.create :name => "Studio Dos", :description => "Sala Simple 2", :district => "Surquillo", :address => "av. Sergio Bernales", :geolocation => "", :phone => "999999", :pictureref => "default_local"

    UserType.create :name => "Administrador", :isadmin => true
    UserType.create :name => "Alumno", :isadmin => false
    UserType.create :name => "Usuario", :isadmin => false

    User.create :givenname => "Administrador", :lastname1 => "lastname1", :lastname2 => "lastname2", :documentnumber => "DNI00001", :documenttype => "DNI", :gender => "Masculino", :email => "administrador@ising.com", :password => "123456", :pictureref => "admin", :user_type_id => 1, :password_confirmation => "123456"
    User.create :givenname => "Alumno", :lastname1 => "lastname1", :lastname2 => "lastname2", :documentnumber => "TUI00002", :documenttype => "TUI", :gender => "Masculino", :email => "alumno@ising.com", :password => "123456", :pictureref => "alumno", :user_type_id => 2, :password_confirmation => "123456"
    User.create :givenname => "Usuario", :lastname1 => "lastname1", :lastname2 => "lastname2", :documentnumber => "DNI00003", :documenttype => "DNI", :gender => "Femenino", :email => "usuario@ising.com", :password => "123456", :pictureref => "user", :user_type_id => 3, :password_confirmation => "123456"

  end

  def down
    User.delete_all

    UserType.delete_all
  end
end
