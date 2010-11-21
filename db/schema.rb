# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091101205119) do

  create_table "sayings", :force => true do |t|
    t.integer  "left_sentence_id"
    t.integer  "right_sentence_id"
    t.string   "language",              :default => "de"
    t.integer  "view_count",            :default => 0
    t.boolean  "original",              :default => false
    t.integer  "awesome_votes_count",   :default => 0
    t.integer  "awefull_votes_count",   :default => 0
    t.integer  "senseless_votes_count", :default => 0
    t.integer  "spam_votes_count",      :default => 0
    t.integer  "favorite_votes_count",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sayings", ["left_sentence_id", "right_sentence_id"], :name => "index_sayings_on_left_sentence_id_and_right_sentence_id"

  create_table "sentences", :force => true do |t|
    t.string   "text"
    t.string   "type"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "saying_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
