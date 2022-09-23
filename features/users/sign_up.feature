Feature: Sign up
  In order to get access to protected sections of the site as a user I want to be able to sign up

    Background:
      Given Coco is not logged in

    Scenario: User signs up with valid data
      When Coco signs up with valid user data
      Then Coco should see a successful sign up message
      
    Scenario: User signs up with invalid email
      When Coco signs up with an invalid email
      Then Coco should see an invalid email message
      And Coco is not logged in

    Scenario: User signs up without password
      When Coco signs up without a password
      Then Coco should see a missing password message

    Scenario: User signs up without password confirmation
      When Coco sign up without a password confirmation
      Then Coco should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message
