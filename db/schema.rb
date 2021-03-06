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

ActiveRecord::Schema.define(version: 2019_11_13_051709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.string "image_url"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_answers_on_review_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "artist"
    t.string "title"
    t.string "year"
    t.date "end_date"
    t.integer "minimum_investment"
    t.string "category"
    t.string "movement"
    t.string "technique"
    t.string "dimension"
    t.string "description_short"
    t.string "description_long"
    t.float "value_increase_rate"
    t.float "payout_rate"
    t.integer "funding_status"
    t.integer "price"
    t.boolean "funded"
    t.bigint "seller_id"
    t.bigint "renter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.index ["renter_id"], name: "index_campaigns_on_renter_id"
    t.index ["seller_id"], name: "index_campaigns_on_seller_id"
  end

  create_table "certificate_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.bigint "certificate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_certificate_items_on_certificate_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.string "full_name"
    t.string "status"
    t.string "investor_address"
    t.string "investment_amount"
    t.string "campaign_name"
    t.string "campaign_image"
    t.string "campaign_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "investment_id"
    t.index ["investment_id"], name: "index_certificates_on_investment_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["campaign_id"], name: "index_images_on_campaign_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.boolean "status", default: false
    t.index ["campaign_id"], name: "index_investments_on_campaign_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state", default: "Pending"
    t.bigint "investment_id"
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.string "checkout_session_id"
    t.string "photo"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_orders_on_campaign_id"
    t.index ["investment_id"], name: "index_orders_on_investment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "renters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.string "username"
    t.string "image_url"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_reviews_on_campaign_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "birthday"
    t.string "languages"
    t.string "location"
    t.string "user_image"
    t.string "phone_number"
    t.string "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "reviews"
  add_foreign_key "campaigns", "renters"
  add_foreign_key "campaigns", "sellers"
  add_foreign_key "certificate_items", "certificates"
  add_foreign_key "certificates", "investments"
  add_foreign_key "images", "campaigns"
  add_foreign_key "investments", "campaigns"
  add_foreign_key "investments", "users"
  add_foreign_key "orders", "campaigns"
  add_foreign_key "orders", "investments"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "campaigns"
end
