class AddFileToPluginVersions < ActiveRecord::Migration
  def change
    add_column :plugin_versions, :file, :string
  end
end
