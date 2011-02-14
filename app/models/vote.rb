class Vote < ActiveRecord::Base
  
  belongs_to :saying
  belongs_to :user, :foreign_key => 'fb_user_id'
  
  validates_presence_of :saying
  validates_presence_of :fb_user_id
  
  validates_presence_of :vote
  
  validates_uniqueness_of :saying_id, :scope => :fb_user_id
  
end
