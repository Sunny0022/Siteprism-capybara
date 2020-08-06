Feature: Publish New Questions in Prashna Site

Scenario: Check the element of signup page
  Given I am on Prashna Site
  When I click Sign up tab
  Then I should see all elements of the page

  Scenario Outline: Filling the signup field data
    Given I am on Prashna Site
    When I click Sign up tab
    Then I should see all elements of the page
    And I fill with <name>, <email>, <passw> and <confirm_pass>
    And User is signed up successfully
    Examples:
      | name    | email              | passw  | confirm_pass |
      | rock688 | rock988@domain.com | 1234a  | 1234a        |
      | test968 | test9880@domain.com| 1224a  | 1224a        |


  Scenario Outline: Filling the Sign In field data
    Given I am on Prashna Site
    And I click login tab
    When I enter the credentials to <email> and <pass>
    Then I should be signed in successfully
    Examples:
      | email            | pass     |
      | sunny@domain.com | sunny123 |
      | rocky@test.com	 | abcd123  |
