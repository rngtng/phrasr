class CreateUsers < ActiveRecord::Migration 
  def self.up 
    create_table :users do |t| 
      t.integer  :facebook_id, :limit => 12, :null => false 
      t.string   :session_key 
      t.datetime :last_notified_on
      t.timestamps 
    end 
  end 
  
  def self.down 
    drop_table :users 
  end 
end