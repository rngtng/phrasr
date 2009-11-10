class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :default => nil, :null => true
      t.string :email
      t.string :crypted_password, :default => nil, :null => true
      t.string :password_salt, :default => nil, :null => true
      t.string :persistence_token
      
      t.string :openid_identifier
      
      t.string :oauth_token
      t.string :oauth_secret
      
      t.timestamps
    end
    
    add_index :users, :oauth_token
    add_index :users, :openid_identifier
    add_index :users, [:login, :password_salt, :crypted_password]
  end
  
  def self.down
    drop_table :users
  end
end
