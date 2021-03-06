require "sentence"

class Saying < ActiveRecord::Base

  belongs_to :left_sentence, :class_name => "LeftSentence", :foreign_key => :left_sentence_id
  belongs_to :right_sentence, :class_name => "RightSentence", :foreign_key => :right_sentence_id

  has_many :awesome_votes
  has_many :awefull_votes
  has_many :spam_votes
  has_many :senseless_votes
  has_many :favorite_votes

  validates_presence_of   :left_sentence_id   #use id here
  validates_presence_of   :right_sentence_id  #use id here
  validates_uniqueness_of :left_sentence_id, :scope => :right_sentence_id

  scope :language, lambda { |language| { :conditions => {:language => language } } }

  def self.populate
    #a high performance database only solution couldn't be found, so do a DB/Rails mixture
    #get all possible combinations ...
    query = "SELECT l.id AS left_sentence_id, r.id AS right_sentence_id, r.language FROM sentences l
    INNER JOIN sentences r ON l.id != r.id AND l.language = r.language
    WHERE CONCAT( l.id, '.', r.id ) NOT IN (#{(Saying.keys << "'dummy'").join( ',')})"

    Saying.find_by_sql( query ).each do |raw_saying|
      # ..and store them in DB if nt yet done
      Saying.new( raw_saying.attributes ).save
     end
  end

  def self.keys
    Saying.find( :all, :select => 'left_sentence_id, right_sentence_id' ).map( &:key )
  end

  def self.weighting
    @weights ||= WEIGHTS.map { |key, weight| "(#{key} * #{weight})" }.join(' + ')
  end

  def self.find_weighted_randomly( language = 'de', limit = 100 )
   order = "#{weighting}, RAND()"
   language(language).all( :include => [ :left_sentence, :right_sentence ], :order => order, :limit => limit ).rand
  end

  ##################################

  def to_xml(options = {})
    super( options.merge(Saying.serialize_options) )
  end

  def to_json(options = {})
    super( options.merge(Saying.serialize_options) )
  end

  def self.serialize_options
    {}.tap do |options|
      options[:only]    = [:id]
      options[:include] = { :left_sentence => Sentence.serialize_options, :right_sentence  => Sentence.serialize_options }
    end
  end

  ##################################

  def key
    "'#{left_sentence_id}.#{right_sentence_id}'"
  end

  def sentence
    "#{left_sentence.text} #{right_sentence.text}"
  end
end
