Feature: Organizations can be created, read, updated and deleted.
  As a user of the People and Organization Entity Domain
  I want to manage People and Organization data
  So that I can track all of the People, Organizations data

  @party_database @party_party_service
  Scenario: Create an Organization
    Given I have provided an organization name of "Acme Co"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then the organization data will be in the database

  @party_party_service
  Scenario: Creating an organization without a name results in an error
    Given I have not provided an organization name
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then I get an error indicating that a name is required

  @party_database @party_party_service
  Scenario: Creating an organization without a party type results in an error
    Given I have not provided an organization name
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have not provided a party type
    When I save the organization
    Then I get an error indicating that a party type is required

  @party_party_service
  Scenario: Creating an organization with a first name results in an error
    Given I have provided an organization name of "Acme Co"
    And I have provided a first name as "Chester"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then I get an error indicating that an organization cannot be created with a first name

  @party_party_service
  Scenario: Creating an organization with a last name results in an error
    Given I have provided an organization name of "Acme Co"
    And I have provided a last name as "Chester"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then I get an error indicating that an organization cannot be created with a last name

  @party_party_service
  Scenario: Creating an organization with a title results in an error
    Given I have provided an organization name of "Acme Co"
    And I have provided a title of "Chester"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then I get an error indicating that an organization cannot be created with a title

  @party_party_service
  Scenario: Creating an organization with a date of birth results in an error
    Given I have provided an organization name of "Acme Co"
    And a date of birth of "10/18/1968"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    When I save the organization
    Then I get an error indicating that an organization cannot be created with a date of birth

  @party_database @party_party_service
  Scenario: Read an Organization by Id
    Given I have provided an organization name of "Acme Co"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    And the organization is in the database
    When I search by the organizations id
    Then I find the organization

  @party_database @party_party_service
  Scenario: Read a list of Organizations
    Given I have provided an organization name of "Acme Co"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    And the organization is in the database
    When I search for all the organizations
    Then I find the organization in the list

  @party_database @party_party_service
  Scenario: Update an Organization
    Given I have provided an organization name of "Acme Co"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    And the organization is in the database
    When I update the name of the organization to "Former Acme Co"
    Then the organization name has been updated

  @party_database @party_party_service
  Scenario: Delete an Organization
    Given I have provided an organization name of "Acme Co"
    And I have provided a government id of "123456789"
    And I have made the comment that "Chesty is very testy"
    And I have provided a party type of "Corporation"
    And the organization is in the database
    When I delete the organization
    Then the organization is no longer in the database



