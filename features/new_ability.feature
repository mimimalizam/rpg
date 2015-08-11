Feature: Character's ability
  As a logged user
  I should be able to visit listing abilities page for a given character
  In order to add new or change existing one

  Background: I am signed in and on the character's page
    Given I am a valid user
    When I go to the login page 
    And fill in my login credentials
    And I click Sign in
    Then I should see "Logout"
    Given there is character named "Warrior"
    When I click on "My characters" link
    Then I should see "Warrior"
    When I click on "Show" link 
    Then I should see the "Warrior" in detail

  Scenario: I want to add new ability
    When I click on "Add ability" link
    Then I should see "New ability"
    When I fill in new ability form
    And I click on Create Ability
    Then I should see "speed"
