# Created by JimBarrows at 7/20/21
Feature: Manage Case Role Type data
  As an admin
  I want to be able to create, read, update and delete Case Role Types
  So that I can better manage the types of roles that a party assigned to a case can have

  @party_ui
  Scenario: Create a Case Role Type
    Given a case name of "This is a case"
    When I save the case
    Then I can find the case in the database
