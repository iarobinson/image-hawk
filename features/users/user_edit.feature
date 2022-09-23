Feature: Edit User
  As a registered user of the website I want to edit my user profile so I can change my username

    Scenario: User can sign in and edit their name
      Given Coco is logged in
      When Coco edits their account name
      And Coco saves the edit form
      Then Coco should see an account edited message

    Scenario: User signs in and edits their email address
      Given Coco is logged in
      When Coco edits their email address
      And Coco saves the edit form
      Then Coco should see an account edited message

#  # TODO: Current password isn't required to edit user data
#    Scenario: User edit my account without current password
#      Given Coco is logged in
#      When Coco edits their email address
#      And Coco doesn't enter their current password
#      And Coco saves the edit form
#      Then Coco should see a current password missing message

    Scenario: User signs in and edits with invalid email
      Given Coco is logged in
      When Coco edits their email address with an invalid email
      And Coco saves the edit form
      Then Coco should see an invalid email message

#   # TODO: Here we need to add the ability to change passwords
#    Scenario: User signs in and edits their password
#      Given Coco is logged in
#      When Coco edits their password
#      And Coco saves the edit form
#      Then Coco should see an account edited message
#
#    Scenario: User signs in and edits their password with missing confirmation
#      Given Coco is logged in
#      When Coco edits their password with missing confirmation
#      And Coco saves the edit form
#      Then Coco should see a mismatched password message
#
#    Scenario: User signs in and edits their password with mismatched confirmation
#      Given Coco is logged in
#      When Coco edits their password with missmatched confirmation
#      And Coco saves the edit form
#      Then Coco should see a mismatched password message
