class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  belongs_to :user

  def self.create_with_omniauth(auth , user)
    create! do |authentication|
      authentication.provider = auth['provider']
      authentication.uid = auth['uid']
      authentication.user_id = user.id
    end
  end
end
