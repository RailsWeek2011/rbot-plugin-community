class Version < ActiveRecord::Base
  belongs_to :plugin

  validates :version, :presence => true
  validates :file, :presence => true 

  mount_uploader :file, VersionUploader

  # returns filename of carrierwave uploaded file
  def filename
    file.file.filename
  end
end
