ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.with_options :bla => :blib  do |face|  #:conditions => { :canvas => true }
    face.resources :sayings, :member => { :vote => :post }
    face.resources :favorites
    
    face.home   '', :controller => 'sayings', :action => 'index'
    
    face.with_options :controller => 'home' do |home|
      home.top    'top',   :action => 'top'
      home.about  'about', :action => 'about'
      #  home.help  'about', :action => 'about'
    end
  end                                                        
end
