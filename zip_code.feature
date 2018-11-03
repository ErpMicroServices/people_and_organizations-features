Feature: Zip Codes must be correctly formatted
  As a user of the People and Organization Entity Domain
  I want to have US zip codes that are both the old zip code and new ones with zip+4
  So that I can use any zip code format

  Scenario: US zip codes are attached to the US.
    Given I have provided a first name as "Chester"
    And I have provided a last name as "Tester"
