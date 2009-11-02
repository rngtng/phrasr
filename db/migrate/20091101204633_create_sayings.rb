class CreateSayings < ActiveRecord::Migration
  def self.up
    create_table :sayings do |t|
      t.integer :left_sentence_id
      t.integer :right_sentence_id
      t.string  :language, :default => 'de'
      t.integer :view_count, :default => 0
      t.boolean :original, :default => 0
      
      t.integer :awesome_votes_count, :default => 0
      t.integer :awefull_votes_count, :default => 0
      t.integer :senseless_votes_count, :default => 0
      t.integer :spam_votes_count, :default => 0
      t.integer :favorite_votes_count, :default => 0

      t.timestamps
    end
    
    add_index :sayings, [:left_sentence_id,:right_sentence_id]
  end

  def self.down
    remove_index :sayings, :column_name
    drop_table :sayings
  end
end
