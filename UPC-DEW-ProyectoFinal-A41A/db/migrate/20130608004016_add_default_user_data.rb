class AddDefaultUserData < ActiveRecord::Migration
  def up
     # not working
    
    #User.create :givenname => "Alumno",:lastname1 => "lastname1",:lastname2 => "lastname2",:documentnumber => "00000000",:documenttype => "TUI",:gender => "Masculino",:email => "alumno@ising.com",:password => "admin",:pictureref => ""
    #User.create :givenname => "Usuario",:lastname1 => "lastname1",:lastname2 => "lastname2",:documentnumber => "00000000",:documenttype => "DNI",:gender => "Femenino",:email => "user@ising.com",:password => "admin",:pictureref => ""
 
  end

  def down
  end
end
