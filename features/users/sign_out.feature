Feature: Sign out
  To protect my account from unauthorized access, a signed in user should be able to sign out

    Scenario: User signs out
      Given Coco is logged in
      When Coco signs out
# TODO: Fix this sign out notification issue
#      Then Coco should see a signed out message
#      When Coco returns to the site
      Then Coco should be signed out
