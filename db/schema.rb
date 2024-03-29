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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150909052903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_articles", force: :cascade do |t|
    t.string   "url"
    t.text     "content"
    t.datetime "crawled_on"
    t.integer  "admin_search_id"
    t.string   "site"
    t.float    "performance_score"
    t.float    "spam_score"
    t.text     "title"
    t.string   "main_image"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "description"
    t.integer  "facebook_shares"
  end

  create_table "admin_searches", force: :cascade do |t|
    t.string   "keywords"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "search_type"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "url"
    t.text     "content"
    t.datetime "crawled_on"
    t.integer  "user_keyword_id"
    t.string   "site"
    t.integer  "performance_score"
    t.float    "spam_score"
    t.text     "title"
    t.string   "main_image"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "quality_score"
    t.integer  "twitter_shares"
    t.integer  "facebook_shares"
    t.integer  "google_plus_shares"
    t.integer  "linkedin_shares"
    t.text     "description"
    t.boolean  "irrelevant",         default: false
    t.boolean  "shares_low",         default: false
    t.boolean  "posted",             default: false
    t.boolean  "is_article",         default: false
    t.integer  "content_tries",      default: 0
    t.integer  "shares_tries",       default: 0
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "username"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "oauth_token"
    t.string   "oauth_secret"
  end

  create_table "user_keywords", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "weight"
    t.integer  "user_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "keyword_type"
    t.boolean  "archived",                     default: false
    t.datetime "last_searched"
    t.integer  "total_results_last_search"
    t.boolean  "searched",                     default: false
    t.integer  "total_results_in_last_search"
    t.boolean  "processing_complete",          default: false
  end

  create_table "user_tweets", force: :cascade do |t|
    t.text     "tweet"
    t.integer  "token_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "last_posted"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
