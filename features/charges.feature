Feature: Charges should work

  Scenario: 
    Given Uncle is an user who has not signed up for an account
    When Phil creates a session with assets
    When Uncle visits the session page
    Then Uncle should be able to make a purchase
