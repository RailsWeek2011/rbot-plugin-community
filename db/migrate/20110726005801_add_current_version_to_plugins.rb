class AddCurrentVersionToPlugins < ActiveRecord::Migration
  def change
    add_column :plugins, :current_version_id, :integer
  end
end
