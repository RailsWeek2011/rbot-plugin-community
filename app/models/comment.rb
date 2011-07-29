class Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :plugin
  belongs_to :user

  def self.all_for_plugin_id(plugin_id)
    where(:plugin_id => plugin_id)
  end

  def self.all_approved_for_plugin_id(plugin_id)
    where(:plugin_id => plugin_id, :approved => true)
  end

  before_create :check_for_spam
  def check_for_spam
    if not Rails.application.config.rakismet[:key].empty?
      self.approved = !spam?
    else
      self.approved = true
    end
    true # continue save
  end
end
