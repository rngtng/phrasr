# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080808184552) do

  create_table "sayings", :force => true do |t|
    t.column "left_sentence_id",  :integer
    t.column "right_sentence_id", :integer
    t.column "language",          :string,   :default => "de"
    t.column "views",             :integer,  :default => 0
    t.column "good",              :integer,  :default => 0
    t.column "bad",               :integer,  :default => 0
    t.column "senseless",         :integer,  :default => 0
    t.column "spam",              :integer,  :default => 0
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
  end

  add_index "sayings", ["left_sentence_id"], :name => "index_sayings_on_left_sentence_id"
  add_index "sayings", ["right_sentence_id"], :name => "index_sayings_on_right_sentence_id"

  create_table "sentences", :force => true do |t|
    t.column "left",       :string
    t.column "right",      :string
    t.column "language",   :string
    t.column "fb_user_id", :integer,  :limit => 8
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string,   :default => "", :null => false
    t.column "data",       :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "facebook_id", :integer,  :limit => 8, :null => false
    t.column "session_key", :string
    t.column "created_at",  :datetime
    t.column "updated_at",  :datetime
  end

  create_table "votes", :force => true do |t|
    t.column "fb_user_id", :integer,  :limit => 8
    t.column "saying_id",  :integer
    t.column "favorite",   :boolean,               :default => false
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

end
