class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :plugin
      t.references :user
      t.string :ip
      t.integer :rate

      t.timestamps
    end
    add_index :ratings, :plugin_id
    add_index :ratings, :user_id
  end
end
