# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120728213039) do

  create_table "movie_casts", :force => true do |t|
    t.string   "name"
    t.string   "character"
    t.integer  "movie_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "theme"
    t.string   "about"
    t.integer  "creator_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "movie_casts", ["movie_id"], :name => "index_movie_casts_on_movie_id"

  create_table "movie_posters", :force => true do |t|
    t.string   "img_type"
    t.string   "link"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "movie_posters", ["movie_id"], :name => "index_movie_posters_on_movie_id"

  create_table "movie_ratings", :force => true do |t|
    t.string   "type"
    t.string   "value"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "movie_ratings", ["movie_id"], :name => "index_movie_ratings_on_movie_id"

  create_table "movie_release_dates", :force => true do |t|
    t.string   "place"
    t.date     "release_date"
    t.integer  "movie_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "movie_release_dates", ["movie_id"], :name => "index_movie_release_dates_on_movie_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "year"
    t.string   "mpaa_rating"
    t.string   "runtime"
    t.string   "critics_consensus"
    t.string   "synopsis"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end
  add_index "events", ["creator_id"], :name => "index_events_on_creator_id"

end
