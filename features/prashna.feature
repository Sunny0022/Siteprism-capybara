Feature: Check elements of the Prashna Site

Scenario Outline: Filling the signup field data
  Given I am on Prashna Site
  When I click Sign up tab
  Then I should see all elements of the page
  And I fill with <name>, <email>, <passw> and <confirm_pass>
  And User is signed up successfully
  Examples:
    | name   | email           | passw  | confirm_pass |
    | Ruby   | Ruby@domain.com | 1234a  | 1234a        |

      
Scenario Outline: Filling the Sign In field data
  Given I am on Prashna Site
  And I click login tab
  When I enter the credentials to <email> and <pass>
  Then I should be signed in successfully
  Examples:
    | email               | pass     |
    | sunny@domain.com    | sunny123 |
     
Scenario: Checking the New Question elements
  Given I am on Prashna Site
  And I click login tab
  When I enter the credentials to <email> and <pass>
  And I click My question tab
  Then I should see the elements of new question form
  Examples:
    | email               | pass     |
    | sunny@domain.com    | sunny123 |
