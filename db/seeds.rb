# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'active_record/fixtures'

Fixtures.create_fixtures("#{Rails.root}/test/fixtures", 'sentences')

query = "INSERT INTO sayings (left_sentence_id,right_sentence_id,language,created_at,updated_at)
         SELECT l.id, r.id, r.language, NOW(), NOW() FROM sentences l 
         JOIN sentences r ON l.type = 'LeftSentence' AND r.type = 'RightSentence' AND l.language = r.language"
Saying.connection.execute(query)