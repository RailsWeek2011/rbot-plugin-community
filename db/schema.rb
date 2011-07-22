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

ActiveRecord::Schema.define(:version => 20110722091213) do

  create_table "comments", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "user_id"
    t.string   "ip"
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["plugin_id"], :name => "index_comments_on_plugin_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "plugin_versions", :force => true do |t|
    t.integer  "plugin_id"
    t.string   "version"
    t.text     "changelog"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_versions", ["plugin_id"], :name => "index_plugin_versions_on_plugin_id"

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "repository"
    t.text     "summary"
    t.text     "description"
    t.text     "installation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins", ["user_id"], :name => "index_plugins_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "user_id"
    t.string   "ip"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["plugin_id"], :name => "index_ratings_on_plugin_id"
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "version_files", :force => true do |t|
    t.integer  "plugin_version_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "version_files", ["plugin_version_id"], :name => "index_version_files_on_plugin_version_id"

end
