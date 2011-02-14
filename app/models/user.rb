class User < ActiveRecord::Base

  has_many :votes,     :foreign_key => :fb_user_id
  has_many :favorites, :foreign_key => :fb_user_id, :class_name => 'Vote', :conditions => "favorite = true"
  has_many :sentences, :foreign_key => :fb_user_id

  def self.for(facebook_id, facebook_session = nil)
    returning find_or_create_by_facebook_id(facebook_id) do |user|
      user.store_session(facebook_session.session_key)  unless facebook_session.nil?
    end
  end

  def friends
    facebook_session.user.friends
    
    #|| dummy user if empty
  end  
    
  def store_session(session_key)
    return if self.session_key == session_key
    update_attribute(:session_key, session_key ) 
  end

  def facebook_session
    @facebook_session ||=  returning Facebooker::Session.create do |session|  
      session.secure_with!( session_key, facebook_id, 1.day.from_now ) 
    end
  end  
end
