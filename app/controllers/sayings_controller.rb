class SayingsController < ApplicationController
  
  def index
  end
  
  def show
  end

  def random
    @saying = Saying.find_weighted_randomly
    render :action => 'show'
  end

end
