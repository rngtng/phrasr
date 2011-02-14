class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :fb_user_id, :limit => 12
      t.integer :saying_id
      t.string  :vote
      t.boolean :favorite, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
