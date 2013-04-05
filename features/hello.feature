Feature: Welcoming new developers
As a software developer
I want the world to be welcomed
So I get a fuzzy feeling of success

  Scenario: Loading the welcome page for id 1
    When I visit "hello" with parameter "1"
    Then I should see "Hello, robert!"

  Scenario: Loading the welcome page for id 2
    When I visit "hello" with parameter "2"
    Then I should see "Hello, jeff!"

