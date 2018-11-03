Feature: Contact Mechanism data can be added, updated and removed from a Person or Organization
  As a user of the People and Organization Entity Domain
  I want to manage Contact Mechanism data
  So that I can track how to communicate with People and Organizations

  Scenario: A person can be create with only an email address
    Given I have provided a first name as ""
    And I have provided a last name as ""
    And I have provided a title of ""
    And I have provided a nickname of ""
    And I have provided a date of birth of ""
    And I have made the comment that ""
    And I have an email "Chester@Tester.com"
    When I save the person
    Then the person data will be in the database
    And the email data will be in the database
