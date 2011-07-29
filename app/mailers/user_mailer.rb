class UserMailer < ActionMailer::Base
  default from: "info@sixserv.org"
  def new_notification(user,model)
    if model.class == Plugin
      new_plugin(user,model) 
    elsif model.class == Comment
      new_comment(user,model)
    elsif model.class == Version
      new_version(user,model)
    else
      print "not a valid model supplied @ usermailer"
    end
  end

  def new_plugin(user,model)
    @plugin = model
    @user = user
    @url = plugin_url(model)
    mail(:to => user.email,
         :subject => "[rbot-plugin-community] A new plugin has been added ["+@plugin.name+"]")
  end

  def new_comment(user,model)
    @user = user
    @plugin =  Plugin.find(model.plugin_id)
    @url = plugin_url(@plugin)
    @comment = model
    mail(:to => user.email,
         :subject => "[rbot-plugin-community] A plugin you watch has been commented ["+@plugin.name+"]")
  end

  def new_version(user,model)
    @user = user
    @plugin =  Plugin.find(model.plugin_id)
    @url = plugin_url(@plugin)
    @version = model
    mail(:to => user.email,
         :subject => "[rbot-plugin-community A plugin you watch has been updated ["+@plugin.name+"]")
  end
end
