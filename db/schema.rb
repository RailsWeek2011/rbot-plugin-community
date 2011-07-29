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

ActiveRecord::Schema.define(:version => 20110728225915) do

  create_table "comments", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "user_id"
    t.string   "ip"
    t.string   "name"
    t.string   "email"
    t.text     "content",    :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  add_index "comments", ["plugin_id"], :name => "index_comments_on_plugin_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "repository"
    t.text     "summary"
    t.text     "description"
    t.text     "installation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_version_id"
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
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
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
    t.string   "fullname"
    t.boolean  "opt_in",                                :default => false
    t.boolean  "is_admin",                              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.integer  "plugin_id"
    t.string   "version"
    t.text     "changelog"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  add_index "versions", ["plugin_id"], :name => "index_versions_on_plugin_id"

end
