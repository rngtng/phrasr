require 'active_record/fixtures' 

class CreateSentences < ActiveRecord::Migration
  def self.up
    create_table :sentences do |t|
      t.string :left
      t.string :right
      t.string :language
      t.integer :fb_user_id, :limit => 12  #bigint
      
      t.timestamps
    end
    
    Fixtures.create_fixtures('test/fixtures', File.basename("sentences.yml", '.*')) 
  end

  def self.down
    drop_table :sentences
  end
end
