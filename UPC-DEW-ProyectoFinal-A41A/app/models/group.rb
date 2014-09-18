class Group < ActiveRecord::Base
  attr_accessible :users, :group_users, :biography, :genre, :name, :picture, :user_ids, :pictureref, :selected_users_id

  has_many :group_users
  has_many :users, :through => :group_users

  attr_accessor :selected_users_id # attributo virtual no en base de datos

end
