class User < ActiveRecord::Base
  # Include Devise Modules
  devise :database_authenticatable, # auth via encrypted password (stored in db)
  #      :omniauthable, # auth via omniauth (github, openid, etc.)
         :registerable, # anyone can sign up
  #      :confirmable, # user needs to confirm by email after sign up
         :recoverable, # user can recover forgotten passwords
         :rememberable, # remember users session via (non-session) cookies
         :trackable, # tracks sign in count, timestamps and IP address
  #      :timeoutable, # expire remembered user sessions
         :validatable # validate email and password

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_many :plugins
end
