Feature: Party role types can be create, updated and deleted
  As a user of the People and Organization Entity Domain
  I want to manage party role types
  So that I can accurately track what kinds of parties I can track

  @party_database
  Scenario: Create a party role type
    Given a party role type  with a description of "Organization"
    When I save the party role type
    Then The party role type is in the database

  @party_database
  Scenario: Read a party role type by description
    Given a party role type with a description of "Organization" has been saved to the database
    When I search for a party role type by the description "Organization"
    Then I find the party role type

  @party_database
  Scenario: Update a party role type
    Given a party role type with a description of "Organization" has been saved to the database
    When I update the description of the party role type to "Update organization"
    Then the party role type description has been updated

  @party_database
  Scenario: Delete a party role type
    Given a party role type with a description of "Organization" has been saved to the database
    When I delete the party role type
    Then the party role type is not in the database

  @party_database
  Scenario: I can create a child of a party role type
    Given a party role type with a description of "Organization" has been saved to the database
    When I add a child party role type with a description of "Informal"
    Then I can find the parent of the child  of the party role type
