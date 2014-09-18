class ConcertUser < ActiveRecord::Base
  attr_accessible :concert_id, :estate, :user_id

  belongs_to :user
  belongs_to :concert
end
