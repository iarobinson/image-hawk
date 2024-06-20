Feature: Important pages should served

  Scenario: Main page is visible
    Given "Uncle" visits the "main" page
    Then Uncle should be on the "home" page

  Scenario: About page is visible
    Given "Uncle" visits the "about" page
    Then Uncle should be on the "about" page 
