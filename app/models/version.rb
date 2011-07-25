class Version < ActiveRecord::Base
  belongs_to :plugin

  validates :version, :presence => true

  mount_uploader :file, VersionUploader
end
