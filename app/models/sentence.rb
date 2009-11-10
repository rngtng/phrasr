class Sentence < ActiveRecord::Base
  has_many :sayings
  has_one :opponent, :class => 'Sentence'
    
  validates_presence_of :text
  validates_presence_of :type
  validates_presence_of :language
  
  validates_uniqueness_of :text, :scope => :type
  
  #script/runner "Sentence.t_proper_yaml" > test/fixtures/sentencesN.yml
  def self.t_proper_yaml
    y = YAML.load_file( 'test/fixtures/sentences.yml' )
    y1 = y.map do |key,data| 
      id = key.gsub('s','').gsub('r','').to_i * 2 + 1
      id += 1 if key =~ /r/
      data['id'] = id
      data['opponent_id'] = (key =~ /r/) ? id - 1 : id + 1
      [key,data]
    end
    h = {}
    y1.each do |key,data| 
      h[key] = data
    end
    
    h.keys.sort{ |a,b| h[a]['id'] <=> h[b]['id'] }.each do |key| 
      puts "s#{h[key]['id']}:"
      %w(id text language type sentence_id).each do |k| 
        v = h[key][k]
        v = '"'+ v +'"' if k == 'text'
        puts "  #{k}: #{v}"
      end
      puts
    end
  end
end

class LeftSentence < Sentence
end

class RightSentence < Sentence
end