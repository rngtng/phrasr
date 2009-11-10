class Vote < ActiveRecord::Base
  STARS = 6
  
  belongs_to :user
  belongs_to :saying, :counter_cache => true
    
  validates_presence_of :saying_id
  validates_numericality_of :stars, :on => :create, :message => "is not a number"
  #validates_presence_of :type
  #validates_presence_of :user_id
  
  validates_uniqueness_of :saying_id, :scope => [:user_id, :type]
end

class StarVote < Vote
  WEIGHT = 10
end

class FavoriteVote < Vote
  WEIGHT = 5
end

class SpamVote < Vote
  WEIGHT = -20
end