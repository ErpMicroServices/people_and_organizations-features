# Created by JimBarrows at 2019-01-29
Feature: As a user
  I want to manage commmunication events for indviduals and groups
  So that I can track what's been communicated, to whom and for what purpose.


  @party_database
  Scenario: I can create a communication event
    Given the following types:
      | communication event        | Incoming call |
      | contact mechanism          | test          |
      | communication event status | done          |
      | party                      | Person        |
      | party relationship         | Testing       |
      | party relationship status  | Active        |
      | party role                 | Sender        |
      | party role                 | Receiver      |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active"
    And a communication event with a note of "This is a note"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Incoming call"
    When I create a communication event
    Then the operation was successful
    And I find the communication event in the database

  @party_database
  Scenario: I can find a communication event by timestamp
    Given the following types:
      | party                      | Person        |
      | party role                 | Sender        |
      | party role                 | Receiver      |
      | communication event        | Find me       |
      | communication event        | Don't find me |
      | party relationship         | Testing       |
      | party relationship status  | Active        |
      | communication event status | done          |
      | contact mechanism          | test          |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active"
    And a communication event with a note of "Dont find this"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Don't find me"
    And a communication event starts on "2000-02-01" at "13:00:00+07"
    And a communication event ends on "2000-02-01" at "14:00:00+07"
    And the communication event is in the database
    And a communication event with a note of "Find this one"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Find me"
    And a communication event starts on "2000-01-01" at "13:00:00+07"
    And a communication event ends on "2000-01-01" at "14:00:00+07"
    And the communication event is in the database
    When I search for communication events that occurred between "11:00+07" and "15:00+07" on "2000-01-01"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

  @party_database
  Scenario: I can find a communication event by type
    Given the following types:
      | party                      | Person        |
      | party role                 | Sender        |
      | party role                 | Receiver      |
      | communication event        | Find me       |
      | communication event        | Don't find me |
      | party relationship         | Testing       |
      | party relationship status  | Active        |
      | communication event status | done          |
      | contact mechanism          | test          |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active"
    And a communication event with a note of "Find by type"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    And a communication event with a note of "Find by type"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    When I search for communication events of type "Find me"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

