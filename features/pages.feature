Feature: Important pages should be reliably visible

  Scenario: 
    Given Uncle is an user who has not signed up for an account
    When Uncle visits the main page
    Then Uncle should see the home page
