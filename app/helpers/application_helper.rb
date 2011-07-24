module ApplicationHelper
  def gravatar_url(user, size=16)
    email_hash = Digest::MD5.hexdigest(user.email.strip.downcase)
    "http://gravatar.com/avatar/#{email_hash}.png?s=#{size}&d=mm"
  end
end
