Feature: Users should be able to sign in and maintain access

  Scenario: A signed in user should have access to the administration dashboard
    Given Uncle is a user who has signed up for an ImageHawk account
    Given Uncle signs into the system
    When Uncle visits the main page
    Then Uncle should see the administration page

  Scenario: A unknown user should be able to create a new account
    Given Uncle is an user who has not signed up for an account
    When Uncle visits the create new account page
    And Uncle submits valid email, password and password confirmation
    And Uncle visits the main page 
    Then Uncle should see the administration page