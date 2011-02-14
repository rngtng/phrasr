# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '307b8a34c931d02b46ef87ce7449305c'

  ensure_application_is_installed_by_facebook_user
    
  skip_before_filter :ensure_application_is_installed_by_facebook_user, :only => :index 
  before_filter :set_facebook_session, :only => :index

  helper_attr   :current_user 
  
  attr_accessor :current_user 
  before_filter :set_current_user
      
  private
  def set_current_user 
    self.current_user = User.for( facebook_session.user.to_i, facebook_session) unless facebook_session.blank?
  end  
end
