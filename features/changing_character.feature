Feature: Editing and destroying characters
  As a logged user 
  I should be able to edit and destroy characters

  Background: User is logged in and on a listing characters page
    When I visit login page
    And fill in my login credentials:
    And I click Sign in button
    Then I should see "Logout"
    Given there is character named "Warrior"
    When I go to listing characters page 
    Then I should see "Warrior"
  
  Scenario: I want to see "Warrior"
    When I click on "Show" link
    Then I should see the "Warrior" in detail

  Scenario: I want to edit  character "Warrior"
    When I click on "Edit" link
    Then I should see "Editing character"
    # fali updejt

  Scenario: I want to destroy "Warrior" character
    When I click on "Destroy" link
    And I click "OK" button
    Then I should not see the "Warrior" anymore
