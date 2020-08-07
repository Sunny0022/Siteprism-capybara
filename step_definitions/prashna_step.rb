require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'assert'
require "#{File.dirname(__FILE__)}/../../features/support/pages/prashna_page"
require "#{File.dirname(__FILE__)}/../../features/support/pages/signup_page"
Capybara.default_driver = :selenium

Given(/^I am on Prashna Site$/) do
  @prashna = PrashnaPage.new
  @prashna.load
  expect(@prashna).to be_displayed
end

And(/^I click login tab$/) do
  @prashna.wait_until_displayed('Home')
  @prashna.wait_until_displayed('Login')
  @prashna.wait_until_displayed('Signup')
  @prashna.should have_content('Prashna')
  click_link 'Login'

end

When(/^I enter the credentials to (.*) and (.*)$/) do |email, pass|
  Capybara.default_max_wait_time = 5
  @prashna.wait_until_email_id_visible
  @prashna.wait_until_pass_visible
  @prashna.signin_field(email, pass)
  click_button 'Login'
end

Then(/^I should be signed in successfully$/) do
  Capybara.default_max_wait_time = 5
  @prashna.wait_until_displayed('Home')
  click_link 'Home'
  @prashna.wait_until_displayed('Logout')
  Capybara.default_max_wait_time = 5
  click_link 'Logout'
  expect(@prashna).to have_content('Logged out')
end

When(/^I click Sign up tab$/) do
  click_link 'Signup'
end

Then(/^I should see all elements of the page$/) do
  @fields = SignUpPage.new
  @fields.load
  Capybara.default_max_wait_time = 5
  @fields.has_content?('Signup Form')
  @fields.has_content?('Name')
  @fields.has_content?('Email')
  @fields.has_content?('Password')
  @fields.has_content?('Password Confirmation')
end




And(/^I fill with (.*), (.*), (.*) and (.*)$/) do |name, email, passw, confirm_pass|
  @fields.signup_field(name, email, passw, confirm_pass)
  click_button 'Submit'
  Capybara.default_max_wait_time = 5
end

And(/^User is signed up successfully$/) do
  expect(@fields).to have_content('Signup successful. Please verify your account, to login')
end


And(/^I click My question tab$/) do
  click_link 'My Questions'
  click_link 'New Question'
end

Then(/^I should see the elements of new question form$/) do
  @question = QuestionsPage.new
  @question.load
  Capybara.default_max_wait_time = 5
  @question.wait_until_displayed(@question.title)
  @question.wait_until_displayed(@question.content)
  @question.wait_until_displayed(@question.topic)
end
