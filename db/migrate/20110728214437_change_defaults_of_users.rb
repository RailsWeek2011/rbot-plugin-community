class ChangeDefaultsOfUsers < ActiveRecord::Migration
  def up
    change_column_default(:users, :opt_in, false)
    change_column_default(:users, :is_admin, false)
  end
end
