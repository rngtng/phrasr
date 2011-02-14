class Sentence < ActiveRecord::Base
  has_many :sayings

  validates_presence_of :right
  validates_presence_of :left
  validates_presence_of :language
  
end

class LeftSentence < Sentence
  
  def text
    left
  end  
end

class RightSentence < Sentence
  def text
    right
  end
end