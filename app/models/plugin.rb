class Plugin < ActiveRecord::Base
  belongs_to :user
  has_many :versions
  has_many :comments
  has_many :ratings

  belongs_to :current_version, :class_name => 'Version', :foreign_key => 'current_version_id'

  # calculate and return the average ratings
  def ratings_average
    Rating.average('rate', :conditions => ['plugin_id = ?', id])
  end
end
