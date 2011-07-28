class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?(user=nil)
    user = user || current_user
    user.is_admin? if user
  end
end
