class CreateVersionFiles < ActiveRecord::Migration
  def change
    create_table :version_files do |t|
      t.references :plugin_version
      t.string :file

      t.timestamps
    end
    add_index :version_files, :plugin_version_id
  end
end
