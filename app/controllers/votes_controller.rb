class VotesController < ApplicationController
  
  def create
    StarVote.create(:saying_id => params[:saying_id], :stars => stars, :user => current_user) if params[:saying_id] && params[:type]
    redirect_to home_path
  end
end
