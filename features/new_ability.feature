Feature: Adding new character's ability
  As a logged user
  I should be able to visit listing abilities page for a given character
  In order to add new one

  Background: I am signed in and on the character's page
    Given I am logged in
    And there is a character named Warrior

  Scenario: I want to add new ability
    When I visit Warrior's page
    And  I click on "Add ability" link
    Then I should see "New ability"
    When I fill in new ability form
    And I click on "Create Ability" button
    Then I should see "speed"
