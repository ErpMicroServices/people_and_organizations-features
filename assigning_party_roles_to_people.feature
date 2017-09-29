Feature: A user can assign roles appropriately to a party
  As a user of party and party role data
  I want to Add/Update/Delete party roles on a party
  So that I can accurately track what roles a party plays in the system and with the business

  @party_database
  Scenario: I can assign a party role to a person
    Given a party role type with a description of "Customer" is in the database
    And a person with a first name of "Chester", a last name of "Tester" is in the database
    When I add the party role "Customer" to the person
    Then the party role "Customer" is in the database
    And the party role from date is today
    And the party role thru date is null
    And the party role type is "Customer"

  @party_database
  Scenario: I can update a party role on a person
    Given a party role type with a description of "Customer" is in the database
    And a party role type with a description of "Prospect" is in the database
    And a person with a first name of "Chester", a last name of "Tester" is in the database
    And I add the party role "Customer" to the person
    When I change the party role of the person to "Prospect"
    Then the party role "Prospect" is in the database
    And the party role from date is today
    And the party role thru date is null
    And the party role type is "Prospect"

  @party_database
  Scenario: I can delete a party role on a person
    Given a party role type with a description of "Customer" is in the database
    And a person with a first name of "Chester", a last name of "Tester" is in the database
    And the person has a party role of "Customer"
    When I delete the party role "Customer"
    Then the party role "Customer" is not in the database
    And the person is still in the database
    And the party role type "Customer" is in the database

  @party_database
  Scenario: I can expire a party role
    Given a party role type with a description of "Customer" is in the database
    And a person with a first name of "Chester", a last name of "Tester" is in the database
    And the person has a party role of "Customer"
    When I expire the party role "Customer"
    Then the party role does not show up for the person
    And the party role "Customer" is in the database
    And the person is still in the database
    And the the thru date for party role "Customer" is set to today


