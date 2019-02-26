# Created by JimBarrows at 2019-01-29
Feature: As a user
  I want to manage commmunication events for indviduals and groups
  So that I can track what's been communicated, to whom and for what purpose.


  @party_database
  Scenario: I can create a communication event
    Given the following types:
      | party                      | Person   |
      | party role                 | Sender   |
      | party role                 | Receiver |
      | communication event        | Testing  |
      | party relationship         | Testing  |
      | party relationship status  | Active   |
      | communication event status | done     |
      | contact mechanism          | test     |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active"
    And a communication event note of "This is a note"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    When I create a communication event
    Then the operation was successful
    And I find the communication event in the database

