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

ActiveRecord::Schema.define(version: 20161028014950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientservices", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "stylist_id", null: false
    t.string  "datetime",   null: false
    t.integer "service_id", null: false
    t.index ["stylist_id"], name: "index_clientservices_on_stylist_id", using: :btree
    t.index ["user_id"], name: "index_clientservices_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string  "name",         null: false
    t.text    "description",  null: false
    t.string  "service_type"
    t.string  "price"
    t.boolean "in_stock"
    t.integer "salon_id"
    t.index ["salon_id"], name: "index_products_on_salon_id", using: :btree
  end

  create_table "salons", force: :cascade do |t|
    t.string  "name",                         null: false
    t.string  "address",                      null: false
    t.string  "city",                         null: false
    t.string  "phone",                        null: false
    t.string  "email"
    t.string  "website"
    t.integer "owner_id",                     null: false
    t.string  "state",                        null: false
    t.string  "zip_code",                     null: false
    t.integer "open_chair_count", default: 0, null: false
    t.string  "image"
    t.index ["owner_id"], name: "index_salons_on_owner_id", using: :btree
  end

  create_table "salonusers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "salon_id"
    t.index ["salon_id"], name: "index_salonusers_on_salon_id", using: :btree
    t.index ["user_id"], name: "index_salonusers_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string  "name",         null: false
    t.text    "description",  null: false
    t.string  "service_type"
    t.integer "salon_id"
    t.string  "price"
    t.string  "time"
    t.index ["salon_id"], name: "index_services_on_salon_id", using: :btree
  end

  create_table "stylistservices", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "user_id",    null: false
    t.index ["service_id"], name: "index_stylistservices_on_service_id", using: :btree
    t.index ["user_id"], name: "index_stylistservices_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "username",                                  null: false
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "phone"
    t.string   "user_type",              default: "client", null: false
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
