Feature: Logged user
  As a logged user
  I should be able to visit characters listing page
  And to logout

  Background: I am signed in
    Given I am a valid user
    When I go to the login page
    And fill in my login credentials:
    And I click "Sign in"
    Then I should see "Logout"

  Scenario: Logout
    When I click on "Logout" link
    Then I should see "Login"

    #Scenario: Visiting homepage
