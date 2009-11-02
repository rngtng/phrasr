class CreateSentences < ActiveRecord::Migration
  def self.up
    create_table :sentences do |t|
      t.string :text
      t.string :type
      t.string :language
      
      t.timestamps
    end
  end

  def self.down
    drop_table :sentences
  end
end