Feature: Sign in
  In order to get access to protected sections of the site, a user should be able to sign in

    Scenario: User is not signed up
      Given Chepe do not exist as a user
      When Chepe signs in with invalid credentials
      Then Chepe should see an invalid login message
      And Chepe should be signed out

    Scenario: User signs in successfully
      Given Coco exists as a user
      And Coco is not logged in
      When Coco signs in with valid credentials
      Then Coco should see a successful sign in message
      When Coco returns to the site
      Then Coco should be signed in

    Scenario: User enters wrong email
      Given Coco exists as a user
      And Coco is not logged in
      When Coco signs in with an incorrect email
      Then Coco should see an invalid login message
      And Coco should be signed out

    Scenario: User enters wrong password
      Given Coco exists as a user
      And Coco is not logged in
      When Coco signs in with an incorrect password
      Then Coco should see an invalid login message
      And Coco should be signed out


