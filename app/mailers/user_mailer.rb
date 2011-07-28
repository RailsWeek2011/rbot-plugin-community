class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(user)
    @user = user
    @url  = "http://awesomerubyplugins.org/login"
    mail(:to => user.email,
         :subject => "Welcome ....")
  end
  def new_plugin(user,plugin)
    @plugin = plugin
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "a new plugin has been added")
  end
  def new_comment(user,plugin)
    @user = user
    @plugin = plugin
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "a plugin u watch has been commented")
  end
  def new_version(user,plugin)
    @plugin = plugin
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "a plugin u watch has been updated")
  end
end
