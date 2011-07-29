class UserMailer < ActionMailer::Base
  default from: "rbot-plugins@sixserv.org"
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
    @url  = Rails.application.config.host+"/"+Rails.application.config.path+"/plugin/"+model.plugin_id.to_s
    mail(:to => user.email,
         :subject => "a new plugin has been added")
  end

  # below @plugin has to be changed something appropriate
  def new_comment(user,model)
    @user = user
    @plugin =  Plugin.find(model.plugin_id)
    @url  = Rails.application.config.host+"/"+Rails.application.config.path+"/plugin/"+model.plugin_id.to_s
    mail(:to => user.email,
         :subject => "a plugin u watch has been commented")
  end
  def new_version(user,model)
    @user = user
    @plugin =  Plugin.find(model.plugin_id)
    @url  = Rails.application.config.host+"/"+Rails.application.config.path+"/plugin/"+model.plugin_id.to_s
    mail(:to => user.email,
         :subject => "a plugin u watch has been updated")
  end
end
