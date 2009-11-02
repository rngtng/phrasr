class Sentence < ActiveRecord::Base
  has_many :sayings

  validates_presence_of :text
  validates_presence_of :type
  validates_presence_of :language
  
  validates_uniqueness_of :text, :scope => :type
  
end

class LeftSentence < Sentence
end

class RightSentence < Sentence
end