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

ActiveRecord::Schema.define(version: 20160208164405) do

  create_table "answerquestions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "askquestion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "answerquestions", ["askquestion_id"], name: "index_answerquestions_on_askquestion_id"
  add_index "answerquestions", ["user_id"], name: "index_answerquestions_on_user_id"

  create_table "askquestions", force: :cascade do |t|
    t.text     "name"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "askquestions", ["topic_id"], name: "index_askquestions_on_topic_id"
  add_index "askquestions", ["user_id"], name: "index_askquestions_on_user_id"

  create_table "commentanswers", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "answerquestion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "commentanswers", ["answerquestion_id"], name: "index_commentanswers_on_answerquestion_id"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "microposts_tags", id: false, force: :cascade do |t|
    t.integer "micropost_id"
    t.integer "tag_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "relationshipvotes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "voted_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationshipvotes", ["voted_id"], name: "index_relationshipvotes_on_voted_id"
  add_index "relationshipvotes", ["voter_id", "voted_id"], name: "index_relationshipvotes_on_voter_id_and_voted_id", unique: true
  add_index "relationshipvotes", ["voter_id"], name: "index_relationshipvotes_on_voter_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics_users", id: false, force: :cascade do |t|
    t.integer "topic_id"
    t.integer "user_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.text     "state"
    t.integer  "user_id"
    t.integer  "answerquestion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "upvotes", ["answerquestion_id"], name: "index_upvotes_on_answerquestion_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.string   "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
