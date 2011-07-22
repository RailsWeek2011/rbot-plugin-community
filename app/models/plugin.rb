class Plugin < ActiveRecord::Base
  belongs_to :user
  has_many :plugin_versions
  has_many :comments
end
