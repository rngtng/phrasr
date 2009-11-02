class SayingsController < ApplicationController
  
  def index
    @left_sentence  = Sentence::LeftSentence.all.rand
    @right_sentence = Sentence::RightSentence.all.rand
  end
  
  def show
  end
  
end
