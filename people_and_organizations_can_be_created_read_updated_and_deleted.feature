Feature: People and Organziation data can be created, read, updated and deleted.
    As a user of the People and Organization Entity Domain
    I want to manage People and Organizaiton data
    So that I can track all fo the People, Organizations data, how and when, what I communicated.

    Scenario: Create a Person
        Given I have provided a first name as "Chester"
        And I have provided a last name as "Tester"
        And I have provided a title of "Mr."
        And I have provided a nickname of "Chesty"
        And I have provided a date of birth of "01/01/2001"
        And I have made the comment that "Chesty is very testy"
        When I save the person
        Then the data will be in the database

    Scenario: Read a person by ID
        Given I have provided a first name as "Chester"
        And I have provided a last name as "Tester"
        And I have provided a title of "Mr."
        And I have provided a nickname of "Chesty"
        And I have provided a date of birth of "01/01/2001"
        And I have made the comment that "Chesty is very testy"
        And the person is in the database
        When I search by the person's id
        Then I find the person

    Scenario: Read list of People
        Given I have provided a first name as "Chester"
        And I have provided a last name as "Tester"
        And I have provided a title of "Mr."
        And I have provided a nickname of "Chesty"
        And I have provided a date of birth of "01/01/2001"
        And I have made the comment that "Chesty is very testy"
        And the person is in the database
        When I search for all people
        Then I find the person in the list

    Scenario: Update a Person
        Given I have provided a first name as "Chester"
        And I have provided a last name as "Tester"
        And I have provided a title of "Mr."
        And I have provided a nickname of "Chesty"
        And I have provided a date of birth of "01/01/2001"
        And I have made the comment that "Chesty is very testy"
        And the person is in the database
        When I update the first name to "Chester2"
        Then the first name is "Chester2"
        And the last name is "Tester"
        And the title is "Mr."
        And the nickname is "Chesty"
        And the date of birth is "01/01/2001"
        And the comment is "Chesty is very testy"

    Scenario: Delete a person
        Given I have provided a first name as "Chester"
        And I have provided a last name as "Tester"
        And I have provided a title of "Mr."
        And I have provided a nickname of "Chesty"
        And I have provided a date of birth of "01/01/2001"
        And I have made the comment that "Chesty is very testy"
        And the person is in the database
        When I delete the person
        Then the person is no longer in the databse
