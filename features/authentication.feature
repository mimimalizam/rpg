Feature: Sign in
  In Order to get access to his data
  A user
  Should be able to sign in

  Scenario: Visiting homepage
    Given I am on the homepage
    Then I should see welcome message

  Scenario: New user signs up
    Given I am on the homepage
    And I follow sign up link
    And I fill my details and press register
    Then I should be signed up 
    
  Scenario: Existing user signs in
    Given I am on the homepage
    Given I am a valid user
    And I fill my details and press sign in
    Then I should be signed in

  Scenario: Invalid user signs in
    Given I am on the homepage
    And I fill my details and press sign in
    Then I should be warned because of invalid sign in 
