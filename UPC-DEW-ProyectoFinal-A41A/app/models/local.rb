class Local < ActiveRecord::Base
  attr_accessible :address, :description, :district, :geolocation, :name, :phone, :pictureref , :estate
  
  validates :name, presence: true, :length => { :minimum => 1, :maximun => 200 }
  validates :address, presence: true, :length => { :minimum => 1, :maximun => 300 }
  validates :phone, presence: true, :length => { :minimum => 6, :maximun => 20 }
  validates :description, presence: true

  acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
  end

end
