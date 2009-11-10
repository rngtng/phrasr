class User < ActiveRecord::Base
  acts_as_authentic do |c|
    #c.openid_required_fields = [:nickname, :email]
  end
  
  attr_accessible :login, :email, :password
  
  private
  
  def map_openid_registration(registration)
    self.login ||= registration['nickname'] 
    self.email    ||= registration['email']
  end
end
