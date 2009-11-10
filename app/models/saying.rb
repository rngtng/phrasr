class Saying < ActiveRecord::Base
  
  belongs_to :left_sentence, :class_name => "Sentence::LeftSentence", :foreign_key => :left_sentence_id
  belongs_to :right_sentence, :class_name => "Sentence::RightSentence", :foreign_key => :right_sentence_id
  
  has_many :votes, :dependent => :destroy
  has_many :awesome_votes
  has_many :awefull_votes
  has_many :spam_votes
  has_many :senseless_votes
  has_many :favorite_votes
  
  validates_presence_of   :left_sentence_id   #use id here
  validates_presence_of   :right_sentence_id  #use id here
  validates_uniqueness_of :left_sentence_id, :scope => :right_sentence_id
  
  named_scope :language, lambda { |language| :conditions => {:language => language } }
  
  def original?
    left_sentence.opponent.id == right_sentence.id
  end
  
  def self.populate
    #a high performance database only solution couldn't be found, so do a DB/Rails mixture
    #get all possible combinations ...
    query = "SELECT l.id AS left_sentence_id, r.id AS right_sentence_id, r.language FROM sentences l
    JOIN sentences r ON l.type = 'LeftSentence' AND  r.type = 'RightSentence' AND l.language = r.language"
    # WHERE AND CONCAT( l.id, '.', r.id ) NOT IN (#{(Saying.keys << "'dummy'").join( ',')})"

 #    Saying.all( :joins => "RIGHT JOIN sentences r ON sayings.right_sentence_id = r.id AND r.type = 'RightSentence' 
 #                          RIGHT JOIN sentences l ON sayings.left_sentence_id = l.id AND l.type = 'LeftSentence' ")                     

    Saying.find_by_sql( query ).each do |raw_saying|       # ..and store them in DB if nt yet done
      Saying.create( raw_saying.attributes )
     end
  end  
  
  def self.keys
    Saying.find( :all, :select => 'left_sentence_id, right_sentence_id' ).map( &:key ) 
  end
  
  def self.weighting
    @weights ||= WEIGHTS.map { |key, weight| "(#{key} * #{weight})" }.join(' + ')
  end  
  
  def self.find_weighted_randomly( language = 'de', limit = 100 )
   language(language).all( :include => [ :left_sentence, :right_sentence ], :order => "#{weighting}, RAND()", :limit => limit ).rand
  end  
  
  ##################################
      
  def key
    [left_sentence_id, right_sentence_id].join('.')
  end
  
  # def key=(key_str)
  #   left_sentence_id, right_sentence_id = key_str.split('.')
  # end
  
  def sentence
    [left_sentence,right_sentence].map(&:text).join('.')
  end  
end
