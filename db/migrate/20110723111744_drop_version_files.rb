class DropVersionFiles < ActiveRecord::Migration
  def up
    drop_table :version_files
  end

  def down
    create_table "version_files", :force => true do |t|
      t.integer  "plugin_version_id"
      t.string   "file"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "version_files", ["plugin_version_id"], :name => "index_version_files_on_plugin_version_id"
  end
end
