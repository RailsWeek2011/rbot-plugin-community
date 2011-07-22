class PluginVersion < ActiveRecord::Base
  belongs_to :plugin
  has_many :version_files
end
