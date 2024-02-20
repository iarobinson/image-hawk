Feature: User properly uploads photos and records sales
  As a visitor to the website I want to see sessions created by photographer users and I want to be able to purchase photographs

  Background: User is Logged In
    Given Coco exists as a user
    And Coco signs in with valid credentials

  Scenario: Coco should be able to view their own photos
    When Coco creates a new session with photos
    And Coco visits that session page
    Then Coco should see the photos

  Scenario: Strangers should be able to view user photos
    When Coco creates a new session with photos
    And Stranger visits that session page
    Then Stranger should see the photos

  # Scenario: The session should be associated with the photos
  #   When Coco creates a new session with photos
  #   And Sally visits that session page
  #   And Sally clicks on the image intending to buy
  #   And Sally clicks the buy button
  #   Then Sally should be redirected to the stripe payment gateway
