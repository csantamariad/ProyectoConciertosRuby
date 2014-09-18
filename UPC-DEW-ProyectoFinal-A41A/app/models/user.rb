class User < ActiveRecord::Base
  belongs_to :user_type
  attr_accessible :email, :gender, :givenname, :lastname1, :lastname2, :documenttype, :documentnumber, :password, :user_type_id, :password_confirmation, :pictureref
  
  attr_accessor :password_confirmation # attributo virtual no en base de datos
  validates_confirmation_of :password # validacionde confirmacion
  validates :givenname, presence: true, :length => { :minimum => 2, :maximun => 100 }
  validates :lastname1, presence: true
  validates :lastname2, presence: true
  validates :documenttype, presence: true
  validates :documentnumber, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :groups_users
  has_many :groups, :through => :groups_users

  has_many :authentications

  def self.new_authentication(auth)
    create! do |user|
      user.email = "twitter@twitter.com"
      user.gender = ""
      user.givenname = auth['info']['name']
      user.lastname1 = auth['info']['name']
      user.lastname2 = auth['info']['name']
      user.documenttype = "DNI"
      user.documentnumber = "123456"
      user.password = "123456"
      user.user_type_id = 3
      user.password_confirmation = "123456"
      user.pictureref = auth['info']['image']
      user.twitter = true
    end
  end

  def self.update_user(user_temp)

    @user = User.find(user_temp[:id])

    @user.email = "twitter@twitter.com"
    @user.gender = user_temp[:gender]
    @user.givenname = user_temp[:givenname]
    @user.lastname1 = user_temp[:lastname1]
    @user.lastname2 = user_temp[:lastname2]
    @user.documenttype = user_temp[:documenttype]
    @user.documentnumber = user_temp[:documentnumber]
    @user.password = "123456"
    @user.user_type_id = user_temp[:documenttype] == 'DNI' ? 3:2
    @user.password_confirmation = "123456"
    @user.pictureref = ""
    @user.twitter = user_temp[:twitter]

    @user.save

  end


end
