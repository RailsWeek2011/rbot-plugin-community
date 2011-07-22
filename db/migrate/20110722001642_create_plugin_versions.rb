class CreatePluginVersions < ActiveRecord::Migration
  def change
    create_table :plugin_versions do |t|
      t.references :plugin
      t.string :version
      t.text :changelog
      t.integer :order

      t.timestamps
    end
    add_index :plugin_versions, :plugin_id
  end
end
