Feature: Users should be able to sign in and maintain access

  Scenario: A signed in user should have access to the administration dashboard
    Given Uncle signs up as a user
    When Uncle visits the main page
    Then Uncle should see the administration page

  Scenario: A unknown user should be able to create a new account
    Given Uncle is an user who has not signed up for an account
    When Uncle visits the create new account page
    And Uncle submits valid email, password and password confirmation
    And Uncle visits the main page
    Then Uncle should see the administration page
  
  Scenario: An unknown user should NOT see the admin page when visiting the root
    Given Uncle is an user who has not signed up for an account
    And Uncle visits the main page
    Then Uncle should NOT see the administration page

  Scenario: An unknown user should sign up and be redirected to their edit page
    Given Uncle is an user who has not signed up for an account
    When Uncle visits the sign up page
    And Uncle submits valid email, password and password confirmation
    Then Uncle should be redirected to the main index page