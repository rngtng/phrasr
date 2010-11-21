class SayingsController < ApplicationController

  def index
    @left_sentence  = Sentence::LeftSentence.random.first
    @right_sentence = Sentence::RightSentence.random.last
  end

  def show
  end

end
