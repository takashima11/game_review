# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_27_131035) do

  create_table "comment_notifications", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "sent_a_notice_customer_id", null: false
    t.integer "got_notified_customer_id", null: false
    t.boolean "notification_status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "customer_id", null: false
    t.string "c_comment", null: false
    t.text "comment_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "follow_notifications", force: :cascade do |t|
    t.integer "follow_id", null: false
    t.integer "sent_a_notice_customer_id", null: false
    t.integer "got_notified_customer_id", null: false
    t.boolean "notification_status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "customer_id", null: false
    t.string "c_follow", null: false
    t.text "follow_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "jenre_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.date "release_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jenres", force: :cascade do |t|
    t.string "jenre_name", null: false
    t.string "model_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "customer_id", null: false
    t.text "body", null: false
    t.string "star", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
