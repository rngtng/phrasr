ActionController::Routing::Routes.draw do |map|
  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  map.home '', :controller => 'sayings', :action => 'random'
  
  map.resource :sayings, :collection => { :random => :get}

  map.resource :votes
end
