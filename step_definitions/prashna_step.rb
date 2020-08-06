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
  @prashna.title
end

And(/^I click login tab$/) do
  @prashna.wait_until_displayed('Home')
  @prashna.wait_until_displayed('Login')
  @prashna.wait_until_displayed('Signup')
  @prashna.should have_content('Prashna')
  click_link 'Login'

end

When(/^I enter the credentials to (.*) and (.*)$/) do |email, pass|
  @prashna.wait_until_email_id_visible
  @prashna.wait_until_pass_visible
  @prashna.signin_field(email, pass)
  click_button 'Login'
end

Then(/^I should be signed in successfully$/) do
  @prashna.wait_until_displayed('Home')
  click_link 'Home'
  @prashna.wait_until_displayed('Logout')
  click_link 'Logout'
  expect(@prashna).to have_content('Logged out')
end

When(/^I click Sign up tab$/) do
  click_link 'Signup'
end

Then(/^I should see all elements of the page$/) do
  @fields = SignUpPage.new
  @fields.load
  @fields.title
  @fields.all_there?
  @prashna.has_content?('Signup Form')
  @prashna.has_content?('Name')
  @prashna.has_content?('Email')
  @prashna.has_content?('Password')
  @prashna.has_content?('Password Confirmation')
end




And(/^I fill with (.*), (.*), (.*) and (.*)$/) do |name, email, passw, confirm_pass|
  @fields.signup_field(name, email, passw, confirm_pass)
  click_button 'Submit'
end

And(/^User is signed up successfully$/) do
  expect(@fields).to have_content('Signup successful. Please verify your account, to login')
end
