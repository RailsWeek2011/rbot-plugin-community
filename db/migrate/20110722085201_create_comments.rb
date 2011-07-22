class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :plugin
      t.references :user
      t.string :ip
      t.string :name
      t.string :email
      t.string :content

      t.timestamps
    end
    add_index :comments, :plugin_id
    add_index :comments, :user_id
  end
end
