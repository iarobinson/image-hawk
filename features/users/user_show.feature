Feature: Show Users
  As a visitor to the website I want to see registered users listed on the homepage so I can know if the site has users

  Scenario: Viewing users
    Given Coco exists as a user
    When Coco signs in with valid credentials
    And Coco look at the list of users
    Then Coco should see their name
