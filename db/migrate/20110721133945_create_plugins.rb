class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.references :user
      t.string :repository
      t.text :summary
      t.text :description
      t.text :installation

      t.timestamps
    end
    add_index :plugins, :user_id
  end
end
