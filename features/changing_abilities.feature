Feature: Changing character's ability
  As a logged user
  I should be able to visit listing abilities page for a given character
  In order to change existing ability

  Background: I'm signed in and on the character's page there is ability speed
    Given I am a valid user
    When I go to the login page
    And fill in my login credentials
    And I click Sign in
    Given there is character named "Warrior"
    When I click on "My characters" link
    Then I should see "Warrior"
    Given character Warrior has ability speed
    When I click on "Show" link
    Then I should see "speed"

  Scenario: I want to edit ability Speed
    When I click on "Edit ability" link
    Then I should see "Editing ability"

  @javascript
  Scenario: I want to destroy ability Speed
    When I click on "Destroy ability" link
    And I click OK
    Then I should not see the "speed" anymore
