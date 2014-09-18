class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert
  attr_accessible :content
end
