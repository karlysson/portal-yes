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

ActiveRecord::Schema.define(version: 20170918133502) do

  create_table "advertising_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "color"
    t.string   "font"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",             limit: 65535
    t.integer  "advertising_category_id"
    t.integer  "company_id"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "site"
    t.string   "choice",                                default: "s"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "twitter"
    t.string   "google"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["advertising_category_id"], name: "index_advertisings_on_advertising_category_id", using: :btree
    t.index ["company_id"], name: "index_advertisings_on_company_id", using: :btree
  end

  create_table "assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.integer  "advertising_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["advertising_id"], name: "index_assets_on_advertising_id", using: :btree
    t.index ["company_id"], name: "index_assets_on_company_id", using: :btree
  end

  create_table "banners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "order"
    t.string   "url"
    t.string   "status"
    t.string   "target"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "city_id"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "zip_code"
    t.time     "initial_care"
    t.time     "end_care"
    t.time     "initial_interval"
    t.time     "end_range"
    t.string   "md_facebook"
    t.string   "md_google"
    t.string   "md_twitter"
    t.text     "obs",               limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["city_id"], name: "index_companies_on_city_id", using: :btree
  end

  create_table "company_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_category_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.integer  "company_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["company_category_id"], name: "index_company_category_relationships_on_company_category_id", using: :btree
    t.index ["company_id"], name: "index_company_category_relationships_on_company_id", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "subject"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "course_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_interations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "page",                     default: "interation"
    t.integer  "page_id"
    t.text     "others",     limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["course_id"], name: "index_course_interations_on_course_id", using: :btree
    t.index ["user_id"], name: "index_course_interations_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "course_category_id"
    t.string   "workload"
    t.text     "obs",                limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["course_category_id"], name: "index_courses_on_course_category_id", using: :btree
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "curriculum_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculum_offices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "curriculum_category_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["curriculum_category_id"], name: "index_curriculum_offices_on_curriculum_category_id", using: :btree
  end

  create_table "curriculum_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status",                  default: "a"
    t.string   "travel"
    t.string   "availability"
    t.string   "name"
    t.date     "birth"
    t.string   "marital_status"
    t.string   "identity"
    t.string   "cpf"
    t.string   "elector_title"
    t.string   "inscription"
    t.string   "zone"
    t.string   "section"
    t.string   "cnh"
    t.string   "professional_experience"
    t.string   "professional_preference"
    t.string   "email"
    t.string   "address"
    t.string   "street"
    t.string   "block"
    t.string   "lot"
    t.string   "sector"
    t.integer  "city_id"
    t.integer  "curriculum_office_id"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "message"
    t.string   "study"
    t.string   "teaching"
    t.string   "period"
    t.string   "courses"
    t.string   "employee"
    t.string   "salary"
    t.string   "father"
    t.string   "profession_father"
    t.string   "mother"
    t.string   "profession_mother"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["city_id"], name: "index_curriculums_on_city_id", using: :btree
    t.index ["curriculum_office_id"], name: "index_curriculums_on_curriculum_office_id", using: :btree
  end

  create_table "indications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "page"
    t.integer  "page_id"
    t.string   "phone"
    t.string   "cell"
    t.string   "email"
    t.string   "profession"
    t.text     "obs",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_indications_on_user_id", using: :btree
  end

  create_table "job_interations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "page"
    t.string   "page_id"
    t.integer  "job_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_job_interations_on_course_id", using: :btree
    t.index ["job_id"], name: "index_job_interations_on_job_id", using: :btree
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "status",                              default: "i"
    t.integer  "curriculum_profile_id"
    t.integer  "curriculum_office_id"
    t.integer  "number"
    t.integer  "city_id"
    t.string   "teaching"
    t.string   "cnh"
    t.string   "travel"
    t.string   "availability"
    t.string   "visible"
    t.text     "description",           limit: 65535
    t.text     "benefit",               limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["city_id"], name: "index_jobs_on_city_id", using: :btree
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
    t.index ["curriculum_office_id"], name: "index_jobs_on_curriculum_office_id", using: :btree
    t.index ["curriculum_profile_id"], name: "index_jobs_on_curriculum_profile_id", using: :btree
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.string   "name"
    t.string   "title"
    t.text     "summary",     limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "prefix"
    t.text     "obs",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "references", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "page",       default: "reference"
    t.integer  "page_id"
    t.string   "name"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["user_id"], name: "index_references_on_user_id", using: :btree
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status",                 default: "i", null: false
    t.string   "email",                  default: "",  null: false
    t.string   "name",                   default: "",  null: false
    t.string   "sex",                    default: "",  null: false
    t.integer  "permission_id",          default: 7
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["permission_id"], name: "index_users_on_permission_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "advertisings", "advertising_categories"
  add_foreign_key "advertisings", "companies"
  add_foreign_key "assets", "companies"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities", name: "fk_city"
  add_foreign_key "company_category_relationships", "companies"
  add_foreign_key "company_category_relationships", "company_categories"
  add_foreign_key "course_interations", "courses"
  add_foreign_key "course_interations", "users"
  add_foreign_key "courses", "course_categories"
  add_foreign_key "courses", "users", name: "fk_course"
  add_foreign_key "curriculum_offices", "curriculum_categories"
  add_foreign_key "curriculums", "cities"
  add_foreign_key "indications", "users"
  add_foreign_key "job_interations", "courses"
  add_foreign_key "job_interations", "jobs"
  add_foreign_key "jobs", "cities", name: "fk_city_job"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "curriculum_offices"
  add_foreign_key "jobs", "curriculum_profiles"
  add_foreign_key "references", "users"
  add_foreign_key "users", "users", column: "permission_id", name: "fk_rais_permission"
end
