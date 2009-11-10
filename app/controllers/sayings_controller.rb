class SayingsController < ApplicationController
  
  def index
  end
  
  def show
  end

  def random
    @saying = Saying.all.rand
    render :action => 'show'
  end

end
