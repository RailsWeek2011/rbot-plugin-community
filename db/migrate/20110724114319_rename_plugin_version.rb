class RenamePluginVersion < ActiveRecord::Migration
  def up
    remove_index :plugin_versions, "plugin_id"
    rename_table :plugin_versions, :versions
    add_index "versions", ["plugin_id"], :name => "index_versions_on_plugin_id"
  end

  def down
    remove_index :plugin_versions, "plugin_id"
    rename_table :versions, :plugin_versions
    add_index "versions", ["plugin_id"], :name => "index_plugin_versions_on_plugin_id"
  end
end
