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

ActiveRecord::Schema.define(:version => 20091108182932) do

  create_table "sayings", :force => true do |t|
    t.integer  "left_sentence_id"
    t.integer  "right_sentence_id"
    t.string   "language",             :default => "de"
    t.integer  "views_count",          :default => 0
    t.integer  "star_votes_count",     :default => 0
    t.integer  "spam_votes_count",     :default => 0
    t.integer  "favorite_votes_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sayings", ["left_sentence_id", "right_sentence_id", "language"], :name => "left_right_lng"

  create_table "sentences", :force => true do |t|
    t.string   "text"
    t.string   "type"
    t.string   "language",    :default => "de"
    t.integer  "opponent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentences", ["id", "type", "language"], :name => "index_sentences_on_id_and_type_and_language"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "openid_identifier"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login", "password_salt", "crypted_password"], :name => "index_users_on_login_and_password_salt_and_crypted_password"
  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token"
  add_index "users", ["openid_identifier"], :name => "index_users_on_openid_identifier"

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "saying_id"
    t.integer  "stars"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
