require File.dirname(__FILE__) + '/../test_helper'

class SayingsControllerTest < ActionController::TestCase
  include Facebooker::Rails::TestHelpers 
  
  
  def test_get_new_requires_user 
    facebook_get :index, :fb_sig_user => nil 
    assert_fb_redirect_to Facebooker::Session.create.install_url 
  end   
  
  def test_show_random
    facebook_get :index 
    assert_response :success 
    assert_template 'show'
    assert assigns(:saying)
    assert assigns(:friend)
  end
  
  def test_show_user_has_no_friends
    
    #assert dummy_user
  end  

  def test_show_specific
    saying = sayings( :first )
    facebook_get :index, :id => saying.id
    assert_response :success 
    assert_template 'show'
    assert_equal saying, assigns(:saying)
  end
    
  def test_vote
    saying = sayings( :first )
    facebook_get :vote, :id => saying.id
  end  

  def test_vote_second_time
    # so Facebooker::User has already vote
    
    saying = sayings( :first )
    facebook_get :vote, :id => saying.id
  end  

  
end
