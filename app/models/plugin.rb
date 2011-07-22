class Plugin < ActiveRecord::Base
  belongs_to :user
  has_many :plugin_versions
end
