Feature: Changing character's abilities
  As a logged user
  I should be able to visit listing abilities page for a given character
  In order to add new one or change existing ability

  Background: I'm logged in and on the character's page there is ability speed
    Given I am logged in
    And there is a character named Warrior
    And character Warrior has ability speed

  Scenario: I want to add new ability
    When I visit Warrior's page
    And I click on "Add ability" link
    Then I should see "New ability"
    When I fill in new ability form
    And I click on "Create Ability" button
    Then I should see "speed"

  Scenario: I want to edit ability Speed
    When I visit Warrior's page
    And I click on "Edit ability" link
    Then I should see "Editing ability"
    When I change ability name to Strength
    And I click on "Update Ability" button
    Then I should see "Strength"

  @javascript
  Scenario: I want to destroy ability Speed
    When I visit Warrior's page
    And I click on "Destroy ability" link
    And I click OK
    Then I should not see the "speed" anymore
