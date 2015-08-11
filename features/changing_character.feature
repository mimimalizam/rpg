Feature: Editing and destroying characters
  As a logged user 
  I should be able to edit and destroy characters

  Background: User is logged in and on a listing characters page
    Given I am logged in
    And there is a character named Warrior
  
  Scenario: I want to see "Warrior"
    When I visit listing characters page
    And I click on "Show" link
    Then I should see the "Warrior" in detail

  Scenario: I want to edit  character "Warrior"
    When I visit listing characters page
    And I click on "Edit" link
    Then I should see "Editing character"
    When I change character name to Princess
    And I click on "Update Character" button
    Then I should see "Princess"

  @javascript
  Scenario: I want to destroy "Warrior" character
    When I visit listing characters page
    And I click on "Destroy" link
    And I click OK 
    Then I should not see the "Warrior" anymore
