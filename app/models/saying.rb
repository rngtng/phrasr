class Saying < ActiveRecord::Base
  
  belongs_to :left_sentence, :class_name => "Sentence::LeftSentence", :foreign_key => :left_sentence_id
  belongs_to :right_sentence, :class_name => "Sentence::RightSentence", :foreign_key => :right_sentence_id
  
  has_many :votes, :dependent => :destroy
  
  has_many :star_votes
  has_many :spam_votes
  has_many :favorite_votes
  
  validates_presence_of   :left_sentence_id   #use id here
  validates_presence_of   :right_sentence_id  #use id here
  validates_uniqueness_of :left_sentence_id, :scope => :right_sentence_id
  
  named_scope :language, lambda { |language| { :conditions => {:language => language } } }
  
  def original?
    left_sentence.opponent.id == right_sentence.id
  end
  
  def self.keys
    Saying.find( :all, :select => 'left_sentence_id, right_sentence_id' ).map( &:key ) 
  end
  
  def self.weighting
   # @weights ||= WEIGHTS.map { |key, weight| "(#{key} * #{weight})" }.join(' + ')
  end  
  
  def self.find_weighted_randomly( language = 'de', limit = 100 )
   #RAND only works with mysql !!!! TODO add condition here?
   language(language).all( :include => [:left_sentence, :right_sentence], :order => "RAND()", :limit => limit ).rand
  end  
  
  ##################################
      
  def key
    [left_sentence_id, right_sentence_id].join('.')
  end
  
  def sentence
    [left_sentence,right_sentence].map(&:text).join(' ')
  end  
end
