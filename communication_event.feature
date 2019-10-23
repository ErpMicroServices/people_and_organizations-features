# Created by JimBarrows at 2019-01-29
Feature: As a user
  I want to manage communication events for individuals and groups
  So that I can track what's been communicated, to whom and for what purpose.


  @party_database
  @party_endpoint
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
      | priority                   | High          |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "This is a note"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "test"
    And a communication event has a type of "Incoming call"
    When I create a communication event
    Then the operation was successful
    And I find the communication event in the database

  @party_database
  @party_endpoint
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
      | priority                   | High          |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
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
  @party_endpoint
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
      | priority                   | High          |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
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

  @party_database
#  @party_endpoint
  Scenario: I can find a communication event by contact mechanism
    Given the following types:
      | party                      | Person          |
      | party role                 | Sender          |
      | party role                 | Receiver        |
      | communication event        | Find me         |
      | communication event        | Don't find me   |
      | party relationship         | Testing         |
      | party relationship status  | Active          |
      | communication event status | done            |
      | contact mechanism          | find this one   |
      | contact mechanism          | ignore this one |
      | priority                   | High            |
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "find this one"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    And a communication event with a note of "Find by type"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "ignore this one"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    When I search for communication events using contact mechanism "find this one"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

  @party_database
#  @party_endpoint
  Scenario: I can find communication events by the party relationship
    Given the following types:
      | party                      | Person          |
      | party                      | Find Person     |
      | party role                 | Find Sender     |
      | party role                 | Find Receiver   |
      | party role                 | Sender          |
      | party role                 | Receiver        |
      | communication event        | Find me         |
      | communication event        | Don't find me   |
      | party relationship         | Find This       |
      | party relationship         | Testing         |
      | party relationship status  | Active          |
      | communication event status | done            |
      | contact mechanism          | find this one   |
      | contact mechanism          | ignore this one |
      | priority                   | High            |
    And there are 2 parties with a type of "Find Person" in the database
    And party 1 has a party role of "Find Sender"
    And party 2 has a party role of "Find Receiver"
    And a party relationship of type "Find This" between party role "Find Sender" and party role "Find Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type - Find"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "find this one"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type -ignore"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "ignore this one"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    When I search for communication events using a party relationship of type "Find This" and party role "Find Sender" and party role "Find Receiver"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

  @party_database
#  @party_endpoint
  Scenario: I can find communication events by the status
    Given the following types:
      | party                      | Person          |
      | party                      | Find Person     |
      | party role                 | Find Sender     |
      | party role                 | Find Receiver   |
      | party role                 | Sender          |
      | party role                 | Receiver        |
      | communication event        | Find me         |
      | communication event        | Don't find me   |
      | party relationship         | Find This       |
      | party relationship         | Testing         |
      | party relationship status  | Active          |
      | communication event status | done            |
      | communication event status | Find me         |
      | contact mechanism          | find this one   |
      | contact mechanism          | ignore this one |
      | priority                   | High            |
    And there are 2 parties with a type of "Find Person" in the database
    And party 1 has a party role of "Find Sender"
    And party 2 has a party role of "Find Receiver"
    And a party relationship of type "Find This" between party role "Find Sender" and party role "Find Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type - Find"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "Find me"
    And a communication event contact mechanism type is "find this one"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type -ignore"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "ignore this one"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    When I search for communication events with a status of "Find me"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

  @party_database
#  @party_endpoint
  Scenario: I can find communication events by the case
    Given the following types:
      | party                      | Person             |
      | party                      | Find Person        |
      | party role                 | Find Sender        |
      | party role                 | Find Receiver      |
      | party role                 | Sender             |
      | party role                 | Receiver           |
      | communication event        | Find me            |
      | communication event        | Don't find me      |
      | party relationship         | Find This          |
      | party relationship         | Testing            |
      | party relationship status  | Active             |
      | communication event status | done               |
      | communication event status | Find me            |
      | contact mechanism          | find this one      |
      | contact mechanism          | ignore this one    |
      | case                       | Customer Complaint |
      | case status                | New                |
      | priority                   | High               |
    And a case description of "Find this case"
    And a case status of "New"
    And a case type of "Customer Complaint"
    And the case is saved to the database
    And there are 2 parties with a type of "Find Person" in the database
    And party 1 has a party role of "Find Sender"
    And party 2 has a party role of "Find Receiver"
    And a party relationship of type "Find This" between party role "Find Sender" and party role "Find Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type - Find"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "Find me"
    And a communication event contact mechanism type is "find this one"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    And the communication event is  part of the case
    And a case description of "Don't Find this case"
    And a case status of "New"
    And a case type of "Customer Complaint"
    And the case is saved to the database
    And there are 2 parties with a type of "Person" in the database
    And party 1 has a party role of "Sender"
    And party 2 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type -ignore"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "ignore this one"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    And the communication event is  part of the case
    When I search for communication events that belongs to a case with description of "Find this case"
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found

  @party_database
#  @party_endpoint
  Scenario: I can find communication events for a party
    Given the following types:
      | party                      | Person             |
      | party                      | Find Person        |
      | party role                 | Find Sender        |
      | party role                 | Find Receiver      |
      | party role                 | Sender             |
      | party role                 | Receiver           |
      | communication event        | Find me            |
      | communication event        | Don't find me      |
      | party relationship         | Find This          |
      | party relationship         | Testing            |
      | party relationship status  | Active             |
      | communication event status | done               |
      | communication event status | Find me            |
      | contact mechanism          | find this one      |
      | contact mechanism          | ignore this one    |
      | case                       | Customer Complaint |
      | case status                | New                |
      | priority                   | High               |
    And a case description of "Find this case"
    And a case status of "New"
    And a case type of "Customer Complaint"
    And the case is saved to the database
    And there are 2 parties with a type of "Find Person" in the database
    And party 1 has a party role of "Find Sender"
    And party 2 has a party role of "Find Receiver"
    And a party relationship of type "Find This" between party role "Find Sender" and party role "Find Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type - Find"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "Find me"
    And a communication event contact mechanism type is "find this one"
    And a communication event has a type of "Find me"
    And the communication event is in the database
    And the communication event is  part of the case
    And a case description of "Don't Find this case"
    And a case status of "New"
    And a case type of "Customer Complaint"
    And the case is saved to the database
    And there are 2 parties with a type of "Person" in the database
    And party 3 has a party role of "Sender"
    And party 4 has a party role of "Receiver"
    And a party relationship of type "Testing" between party role "Sender" and party role "Receiver" in status "Active" with priority "High"
    And a communication event with a note of "Find by type -ignore"
    And a communication event is for a relationship between party 1 and party 2
    And a communication event status is "done"
    And a communication event contact mechanism type is "ignore this one"
    And a communication event has a type of "Don't find me"
    And the communication event is in the database
    And the communication event is  part of the case
    When I search for communication events that belongs to party 1
    Then the operation was successful
    And the communication event of type "Find me" is found
    And the communication event of type "Don't find me" is not found
