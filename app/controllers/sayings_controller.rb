class SayingsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    Sentence
    @left_sentence  = LeftSentence.random.first
    @right_sentence = RightSentence.random.last

    @saying = Saying.new( :left_sentence => @left_sentence, :right_sentence => @right_sentence )

   @saying.save!

    respond_with @saying
  end

  def show
    @saying = Saying.find params[:id]
    respond_with @saying
  end

end
