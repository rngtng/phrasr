ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.home '', :controller => 'sayings', :action => 'index'
  
  map.resource :sayings
  
end
