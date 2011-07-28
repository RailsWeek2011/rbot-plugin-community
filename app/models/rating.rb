class Rating < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :user

  validates :rate, :presence => true, 
                   :numericality => { :only_integer => true, 
                                      :greater_or_equal_to => 1, 
                                      :less_than_or_equal_to => 5}

  validate :cannot_rate_own_plugin
  def cannot_rate_own_plugin
    if user and user.id == plugin.user.id
      errors[:base] << "you can't rate your own plugin!"
    end
  end

  validate :ensure_unique_rating_by_ip
  def ensure_unique_rating_by_ip
    if ip
      # query for ratings with same ip and plugin_id
      ratings = Rating.where(:plugin_id => plugin_id, :ip => ip)
      if not ratings.empty?
        errors[:base] << "you can only rate this plugin once! (rating found by IP #{ip})"
      end
    end
  end

  validate :ensure_unique_rating_by_user
  def ensure_unique_rating_by_user
    if user_id
      # query for ratings with same user and plugin_id
      ratings = Rating.where(:plugin_id => plugin_id, :user_id => user_id)
      if not ratings.empty?
        errors[:base] << "you can only rate this plugin once! (rating found by user #{user_id})"
      end
    end
  end
end
