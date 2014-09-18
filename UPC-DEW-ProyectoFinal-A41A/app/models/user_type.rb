class UserType < ActiveRecord::Base
  attr_accessible :isadmin, :name
  has_many :users
end
