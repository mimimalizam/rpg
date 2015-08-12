Feature: Adding new character and editing or  destroying existing character
  As a logged user 
  I should be able to add new character and to edit or destroy existing characters

  Background: User is logged in
    Given I am logged in
    And there is a character named Warrior

  Scenario: I am visiting listing characters page
    When I click on "My characters" link
    Then I should see "Listing characters"

  Scenario: I want to create New Character
    When I click on "New character" link
    Then I should see "Name"
    And I should see "Avatar"
    When I fill in new character form
    And I click on "Create Character" button
    Then I should see created character
  
  Scenario: I want to see "Warrior"
    When I click on "My characters" link
    And I click on "Show" link
    Then I should see the "Warrior" in detail

  Scenario: I want to edit character "Warrior"
    When I click on "My characters" link
    And I click on "Edit" link
    Then I should see "Editing character"
    When I change character name to Princess
    And I click on "Update Character" button
    Then I should see "Princess"

  @javascript
  Scenario: I want to destroy "Warrior" character
    When I click on "My characters" link
    And I click on "Destroy" link
    And I click OK 
    Then I should not see the "Warrior" anymore
