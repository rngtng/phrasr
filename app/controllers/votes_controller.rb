class SayingsController < ApplicationController
  respond_to :html, :xml, :json

  def create
    Vote.new(params[:vote])
    @saying = Saying.find params[:saying_id]
    
    @saying.update_attributes!( params[:saying] )
    
    #if html redirect to saying
    
    # else return OK + saying!?
    respond_with @saying
  end
end