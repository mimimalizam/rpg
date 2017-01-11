Feature: Authenticating users
  In order to act as valid user
  One
  Should be able to sign up, sign in and log out

  Scenario: Visiting homepage
    Given I am on the homepage
    Then I should see welcome message

  Scenario: New user signs up
    Given I am on the homepage
    When I follow sign up link
    And I fill my details and press register
    Then I should be signed up 
    
  Scenario: Existing user signs in
    Given I am on the homepage
    And I am a valid user
    When I fill my details and press sign in
    Then I should be signed in

  Scenario: Logged user wants to log out
    Given I am logged in
    When I click on "Logout" link
    Then I should see "Login"

  Scenario: Invalid user signs in
    Given I am on the homepage
    When I fill my details and press sign in
    Then I should be warned because of invalid credentials
