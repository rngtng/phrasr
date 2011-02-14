class CreateSayings < ActiveRecord::Migration
  def self.up
    create_table :sayings do |t|
      t.integer :left_sentence_id
      t.integer :right_sentence_id
      t.string  :language, :default => 'de'
      t.integer :views, :default => 0
      t.integer :good, :default => 0
      t.integer :bad, :default => 0
      t.integer :senseless, :default => 0
      t.integer :spam, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :sayings
  end
end
