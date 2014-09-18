class Concert < ActiveRecord::Base
  belongs_to :local
  belongs_to :group

  has_many :concert_users
  has_many :user , :through => :concert_users


  attr_accessible :dateend, :datestart, :description, :headline, :totalscore , :local_id , :group_id  , :estate
end
