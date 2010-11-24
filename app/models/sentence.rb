class Sentence < ActiveRecord::Base
  has_many :sayings

  validates_presence_of :text
  validates_presence_of :type
  validates_presence_of :language

  validates_uniqueness_of :text, :scope => :type

  scope :random, :order => "RAND()", :limit => 1

  ##################################

  def to_xml(options = {})
    super( options.merge(Sentence.serialize_options) )
  end

  def to_json(options = {})
    super( options.merge(Sentence.serialize_options) )
  end

  def self.serialize_options
    {}.tap do |options|
      options[:only] = [:id, :text]
    end
  end

  ##################################

end

class LeftSentence < Sentence
end

class RightSentence < Sentence
end