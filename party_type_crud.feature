Feature: Party types can be create, updated and deleted
  As a user of the People and Organization Entity Domain
  I want to manage party types
  So that I can accurately track what kinds of parties I can track

  @party_database
  Scenario: Create a party type
    Given a party type description of "Organization"
    When I save the party type
    Then The party type is in the database

  @party_database
  Scenario: Read a party type by description
    Given a party type with a description of "Organization" has been saved to the database
    When I search by the description "Organization"
    Then I find the party type

  @party_database
  Scenario: Update a party type
    Given a party type with a description of "Organization" has been saved to the database
    When I update the description to "Update organization"
    Then the organization description has been updated

  @party_database
  Scenario: Delete a party type
    Given a party type with a description of "Organization" has been saved to the database
    When I delete the party type
    Then the party type is not in the database

  @party_database
  Scenario: I can create a child of a party type
    Given a party type with a description of "Organization" has been saved to the database
    When I add a child party type with a description of "Informal"
    Then I can find the parent of the child
