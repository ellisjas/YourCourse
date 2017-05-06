ActiveRecord::Schema.define(version: 20170505114247) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorisations", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categorisations_on_category_id"
    t.index ["course_id", "category_id"], name: "index_categorisations_on_course_id_and_category_id", unique: true
    t.index ["course_id"], name: "index_categorisations_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "prerequisite"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_courses_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "locatables", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id", "location_id"], name: "index_locatables_on_course_id_and_location_id", unique: true
    t.index ["course_id"], name: "index_locatables_on_course_id"
    t.index ["location_id"], name: "index_locatables_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
