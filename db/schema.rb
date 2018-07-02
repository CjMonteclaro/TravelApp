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

ActiveRecord::Schema.define(version: 20180606021912) do

  create_table "benefit_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefit_limits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "destination_class_id"
    t.bigint "benefit_category_id"
    t.bigint "benefit_id"
    t.string "currency"
    t.decimal "limit", precision: 10, scale: 2
    t.string "remarks"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_category_id"], name: "index_benefit_limits_on_benefit_category_id"
    t.index ["benefit_id"], name: "index_benefit_limits_on_benefit_id"
    t.index ["destination_class_id"], name: "index_benefit_limits_on_destination_class_id"
  end

  create_table "benefits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "benefit_category_id"
    t.string "name"
    t.text "description"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_category_id"], name: "index_benefits_on_benefit_category_id"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "shortname"
    t.string "shortname2"
    t.string "capital"
    t.string "region"
    t.string "subregion"
    t.bigint "destination_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_class_id"], name: "index_countries_on_destination_class_id"
  end

  create_table "destination_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "quote_id"
    t.bigint "traveller_id"
    t.string "payment_via"
    t.string "online_policy_no"
    t.integer "genweb_policy_id"
    t.string "genweb_policy_no"
    t.integer "genweb_bill_no"
    t.string "genweb_receipt_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_policies_on_quote_id"
    t.index ["traveller_id"], name: "index_policies_on_traveller_id"
    t.index ["user_id"], name: "index_policies_on_user_id"
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "address1"
    t.string "address2"
    t.integer "city_id"
    t.integer "province_id"
    t.integer "zip_code"
    t.integer "area_code"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quotes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.date "start_date"
    t.date "end_date"
    t.date "schengen_end_date"
    t.integer "duration"
    t.bigint "destination_class_id"
    t.bigint "traveller_type_id"
    t.integer "travellers_count"
    t.integer "policies_count"
    t.bigint "travel_prem_id"
    t.decimal "base_prem", precision: 10, scale: 2
    t.decimal "total_charges", precision: 10, scale: 2
    t.decimal "gross_prem", precision: 10, scale: 2
    t.date "policy_issued"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_class_id"], name: "index_quotes_on_destination_class_id"
    t.index ["travel_prem_id"], name: "index_quotes_on_travel_prem_id"
    t.index ["traveller_type_id"], name: "index_quotes_on_traveller_type_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "travel_destinations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quote_id"
    t.bigint "country_id"
    t.integer "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_travel_destinations_on_country_id"
    t.index ["quote_id"], name: "index_travel_destinations_on_quote_id"
  end

  create_table "travel_periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_prems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "destination_class_id"
    t.bigint "travel_period_id"
    t.decimal "premium", precision: 10, scale: 2
    t.string "prem_type"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_class_id"], name: "index_travel_prems_on_destination_class_id"
    t.index ["travel_period_id"], name: "index_travel_prems_on_travel_period_id"
  end

  create_table "traveller_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quote_id"
    t.bigint "policy_id"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.integer "age"
    t.string "beneficiary"
    t.boolean "privacy_opt_in"
    t.bigint "travel_prem_id"
    t.decimal "base_prem", precision: 10, scale: 2
    t.decimal "total_charges", precision: 10, scale: 2
    t.decimal "gross_prem", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_id"], name: "index_travellers_on_policy_id"
    t.index ["quote_id"], name: "index_travellers_on_quote_id"
    t.index ["travel_prem_id"], name: "index_travellers_on_travel_prem_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.boolean "enabled"
    t.boolean "email_opt_in"
    t.boolean "privacy_opt_in"
    t.datetime "tos_agreed"
    t.integer "policies_count"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefit_limits", "benefit_categories"
  add_foreign_key "benefit_limits", "benefits"
  add_foreign_key "benefit_limits", "destination_classes"
  add_foreign_key "benefits", "benefit_categories"
  add_foreign_key "countries", "destination_classes"
  add_foreign_key "policies", "quotes"
  add_foreign_key "policies", "travellers"
  add_foreign_key "policies", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "quotes", "destination_classes"
  add_foreign_key "quotes", "travel_prems"
  add_foreign_key "quotes", "traveller_types"
  add_foreign_key "quotes", "users"
  add_foreign_key "travel_destinations", "countries"
  add_foreign_key "travel_destinations", "quotes"
  add_foreign_key "travel_prems", "destination_classes"
  add_foreign_key "travel_prems", "travel_periods"
  add_foreign_key "travellers", "quotes"
  add_foreign_key "travellers", "travel_prems"
end
