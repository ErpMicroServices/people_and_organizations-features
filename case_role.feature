# Created by JimBarrows at 2018-12-08
Feature: As a user
	I want to be able to manage data about cases
	So that I can carry out various business functions

	@party_database
	@party_endpoint
	Scenario: I can create a case with case roles
		Given the following types:
			| case        | Customer Complaint |
			| case role   | Participant        |
			| case status | New                |
			| party       | Person             |
		And a case description of "Test Case"
		And a case status of "New"
		And a case type of "Customer Complaint"
		And 5 parties of type "Person" have a case role type "Participant"
		And a case type of "Customer Complaint"
		When I save the case
		Then the operation was successful
		And the case is in the database
		And the case has 5 roles
		And the 5 roles have type "Participant"
		And the roles include the parties

	@party_database
	@party_endpoint
	Scenario: I can add a case role to a case
		Given the following types:
			| case        | Customer Complaint |
			| case role   | Participant        |
			| party       | Person             |
			| case status | New                |
		And a case description of "This is a case"
		And a case status of "New"
		And a case type of "Customer Complaint"
		And the case is saved to the database
		And a party with a comment of "Case Role Party" and a type of "Person" is in the database
		When I add a party with case role "Participant" to the case
		Then the operation was successful
		And the case is in the database
		And the case has 1 roles
		And the 1 roles have type "Participant"
		And the roles include the parties

	@party_database
	@party_endpoint
	Scenario: I can update a case role to a case
		Given the following types:
			| case        | Customer Complaint |
			| case role   | Participant        |
			| party       | Person             |
			| case status | New                |
		And a case description of "This is a case"
		And a case status of "New"
		And a case type of "Customer Complaint"
		And the case is saved to the database
		And a party with a comment of "Case Role Party" and a type of "Person" is in the database
		And a party with case role "Participant" has been added to the case
		And a party with a comment of "New Case Role Party" and a type of "Person" is in the database
		When I change the party in the role
		Then the operation was successful
		And the case is in the database
		And the case has 1 roles
		And the 1 roles have type "Participant"
		And the role includes the party

	@party_database
	@party_endpoint
	Scenario: I can delete a case role in a case
		Given the following types:
			| case        | Customer Complaint |
			| case role   | Participant        |
			| party       | Person             |
			| case status | New                |
		And a case description of "This is a case"
		And a case status of "New"
		And a case type of "Customer Complaint"
		And the case is saved to the database
		And a party with a comment of "Case Role Party" and a type of "Person" is in the database
		And a party with case role "Participant" has been added to the case
		When I delete the case role
		Then the operation was successful
		And the case is in the database
		And the case has 0 roles
		And the party is in the database

