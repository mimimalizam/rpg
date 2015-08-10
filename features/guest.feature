Feature: Guest trying to visit pages
  In order to get access to characters listing page
  A guest should become registered and signed in user

  Background: I am guest 
    Given I am not signed in
    
  Scenario: Guest visits character listing page
    When I visit characters_path
    Then I should see "You need to sign in or sign up before continuing" message
