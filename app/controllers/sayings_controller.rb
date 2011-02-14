class SayingsController < ApplicationController
  before_filter :find_saying #, :except => [ :index ]
  before_filter :find_friend, :only => [ :index, :show ]
  
  def index
    render :action => 'show'
  end
    
  def show    
  end
  
  def vote
    current_user.votes.create( :saying => @saying, :vote => params[:commit] )    
  rescue #may fail if user already voted
      
  ensure
    redirect_to sayings_path
  end
    
  private  
  def find_saying
    @saying = params[:id] ? Saying.find( params[:id] ) : Saying.find_weighted_randomly
  end  
  
  def find_friend
    @friend = current_user.friends.rand
  end
  
  #def update_profile( user ) 
  #  return if user.facebook_session.blank? 
  #  
  #  facebook_user = Facebooker::User.new( user.facebook_id ) 
  #  content = render_to_string( :partial => "profile",        :locals => { :user => user } ) 
  #  mobile  = render_to_string( :partial => "mobile_profile", :locals => { :user => user } )
  #  action  = render_to_string( :partial => "profile_action", :locals => { :user => user } ) 
  #  facebook_user.set_profile_fbml( content, mobile, action ) 
  #end 
      
end
