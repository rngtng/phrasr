class CreateSentences < ActiveRecord::Migration
  def self.up
    create_table :sentences do |t|
      t.string :text
      t.string :type
      t.string :language, :default => 'de'
      t.integer :opponent_id
      
      t.timestamps
    end
    
    add_index :sentences, [:id, :type, :language]
  end

  def self.down
    drop_table :sentences
  end
end