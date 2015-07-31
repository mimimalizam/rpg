Feature: Sign in
	In Order to get access to his data
	A user
	Should be able to sign in

Scenario: Visiting homepage
	Given I am on the homepage
	Then I should see welcme message

  Scenario: New user signs up
    Given I am on the homepage
    And I follow sign up link
    And I fill my details and press register
    Then I should be signed up

