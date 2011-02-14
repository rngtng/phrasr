class AddIndexToSayings < ActiveRecord::Migration
  def self.up
    change_table :sayings do |t|
      t.index :left_sentence_id
      t.index :right_sentence_id
    end  
    
  end

  def self.down
    remove_index :sayings, :left_sentence_id
    remove_index :sayings, :right_sentence_id
  end
end
