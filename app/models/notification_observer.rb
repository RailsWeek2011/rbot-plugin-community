class NotificationObserver < ActiveRecord::Observer
  observe :plugin, :comment, :version

  def irc(msg)
    require 'rubygems'
    require 'drb'
    password = Rails.application.config.rbot_password
    username = Rails.application.config.rbot_username
    channel = Rails.application.config.rbot_channel
    url = Rails.application.config.rbot_url
    rbot = DRbObject.new_with_uri(url)
    id = rbot.delegate(nil, "remote login "+username+" "+password+"")[:return]
    rbot.delegate(id, "dispatch say "+channel+" "+msg)
  end

  def after_create(model)
    msg = "";
    if model.class == Plugin
      msg = "[rbot-plugin-community] new plugin added: \"" + model.name + "\""
    elsif model.class == Comment
      msg = "[rbot-plugin-community] new comment for plugin: \"" + model.plugin.name + "\" added by: " + model.user.username
    elsif model.class == Version
      msg = "[rbot-plugin-community] new version: \"" + model.plugin.name + "\" Version: " + model.version
    end

    #msg = msg + " notification sent to: "
    @users = User.all
    @users.each do |user|
      UserMailer.new_notification(user,model)
      print "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      # Planed for future releases: Userdefined Abonements:  if user.abos.each abo.id => plugin.id...:
      if user.opt_in == nil
        print "is nil" # just for testing
      elsif user.opt_in == true
        UserMailer.delay.new_notification(user,model)
        #msg = msg + user.username + " "
      end
    end
  self.delay.irc(msg)
  end

  # maybe interesting for later use... STUB
  #def after_update
  #  if model.class == Plugin
  #    print "edited"
  #  end
  #end
end
