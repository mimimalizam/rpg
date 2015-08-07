Feature: Logged user
  As a logged user
  I should be able to visit listing characters page
  And to logout

  Background: I am signed in
    Given I am a valid user
    When I go to the login page
    And fill in my login credentials
    And I click Sign in
    Then I should see "Logout"

  Scenario: Logout
    When I click on "Logout" link
    Then I should see "Login"

  Scenario: Visiting listing characters page
    When I click on "My characters" link
    Then I should see "Listing characters"

  Scenario: Creating New Character
    When I click on "New character" link
    Then I should see "Name"
    And I should see "Avatar"
    When I fill in new character form
    And I click on Create Character
    Then I should see created character
