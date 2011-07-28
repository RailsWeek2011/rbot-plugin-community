module ApplicationHelper
  def domain_name(url)
    URI.parse(url).host
  end

  def gravatar_url(email, size=16)
    email_hash = Digest::MD5.hexdigest(email.strip.downcase)
    "http://gravatar.com/avatar/#{email_hash}.png?s=#{size}&d=mm"
  end

  def format_date(timestamp)
    timestamp.strftime('%d %B %Y')
  end

  def current_user_owns?(model)
    if model.respond_to? :user and current_user == model.user
      true
    else
      false
    end
  end
end
