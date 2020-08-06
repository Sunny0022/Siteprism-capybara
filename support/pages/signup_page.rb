require 'site_prism'
require 'capybara/cucumber'

class SignUpPage < SitePrism::Page

  set_url 'http://rahul.domain4now.com/signup'
  element :name, '[id = "user_name"]'
  element :mail,  '[id = "user_email"]'
  element :pass,  '[id = "user_password"]'
  element :confirm_pass,  '[id = "user_password_confirmation"]'

  def signup_field(nam, mailid, passs,confirm_passs)
    name.set nam
    mail.set mailid
    pass.set passs
    confirm_pass.set confirm_passs
  end
end
