class Plugin < ActiveRecord::Base
  belongs_to :user
  has_many :versions
  has_many :comments

  belongs_to :current_version, :class_name => 'Version', :foreign_key => 'current_version_id'
end
