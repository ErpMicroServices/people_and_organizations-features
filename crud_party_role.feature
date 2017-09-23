Feature: Party roles can be create, updated and deleted
  As a user of the People and Organization Entity Domain
  I want to manage party roles
  So that I can accurately track what kinds of parties I can track

  @party_database
  Scenario: Create a party role
    Given a party role description of "Organization"
    When I save the party role
    Then The party role is in the database

  @party_database
  Scenario: Read a party role by description
    Given a party role with a description of "Organization" has been saved to the database
    When I search by the description "Organization"
    Then I find the party role

  @party_database
  Scenario: Update a party role
    Given a party role with a description of "Organization" has been saved to the database
    When I update the description to "Update organization"
    Then the organization description has been updated

  @party_database
  Scenario: Delete a party role
    Given a party role with a description of "Organization" has been saved to the database
    When I delete the party role
    Then the party role is not in the database

  @party_database
  Scenario: I can create a child of a party role
    Given a party role with a description of "Organization" has been saved to the database
    When I add a child party role with a description of "Informal"
    Then I can find the parent of the child