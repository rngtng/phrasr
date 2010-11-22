class Vote < ActiveRecord::Base
  
  belongs_to :saying, :counter_cache => true
  belongs_to :user
  
  validates_presence_of :saying
  validates_presence_of :user_id
  validates_presence_of :type
  
  validates_uniqueness_of :saying_id, :scope => [:user_id, :type]
end

class AwesomeVote < Vote
  WEIGHT = 10
end

class AwefullVote < Vote
  WEIGHT = -9
end

class SenselessVote < Vote
  WEIGHT = -15
end

class FavoriteVote < Vote
  WEIGHT = 5
end

class SpamVote < Vote
  WEIGHT = -20
end