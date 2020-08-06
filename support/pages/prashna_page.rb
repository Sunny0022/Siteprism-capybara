require 'site_prism'
require 'capybara/cucumber'

class PrashnaPage < SitePrism::Page

  set_url 'http://rahul.domain4now.com/'
  element :email_id, '[id = "email"]'
  element :pass, '[id = "password"]'

  def signin_field(mail,pas)
    email_id.set mail
    pass.set pas
  end
end
