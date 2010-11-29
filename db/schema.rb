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

ActiveRecord::Schema.define(:version => 20101129161050) do

  create_table "animals", :force => true do |t|
    t.string   "genus"
    t.string   "species"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", :force => true do |t|
    t.string   "property"
    t.string   "thing"
    t.integer  "user_id"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["pet_id"], :name => "fk_interests_pets"
  add_index "interests", ["user_id"], :name => "fk_interests_users"

  create_table "notifications", :force => true do |t|
    t.text     "contents"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "time"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["destination_id"], :name => "fk_notifications_dest"
  add_index "notifications", ["source_id"], :name => "fk_notifications_source"

  create_table "pets", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "gender"
    t.integer  "age"
    t.integer  "animal_id",   :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "personality"
  end

  add_index "pets", ["animal_id"], :name => "fk_pets_animals"
  add_index "pets", ["user_id"], :name => "fk_pets_users"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "address"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
