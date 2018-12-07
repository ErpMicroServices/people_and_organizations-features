# Created by JimBarrows at 11/25/18
Feature: As a user
  I want to be able to manage data about cases
  So that I can carry out various business functions

  Scenario: I can view a list of cases
	Given there are 5 cases with a type of "Customer Complaint" with a status of "New" in the database
	And there are 5 cases with a type of "Sales Negotiation" with a status of "New" in the database
	When I search for all cases
	Then I get 10 cases
	And 5 of them are cases of type "Customer Complaint"
	And 5 of them are cases of type "Sales Negotiation"

  Scenario: I can view a list of cases by type
	Given there are 5 cases with a type of "Customer Complaint" with a status of "New" in the database
	And there are 5 cases with a type of "Sales Negotiation" with a status of "Old" in the database
	When I search for cases of type "Customer Complaint"
	Then I get 5 cases
	And 5 of them are cases of type "Customer Complaint"
	And 0 of them are cases of type "Sales Negotiation"

  Scenario: I can view a list of cases by status
	Given there are 5 cases with a type of "Customer Complaint" with a status of "New" in the database
	And there are 5 cases with a type of "Sales Negotiation" with a status of "Old" in the database
	When I search for cases with a status of "New"
	Then I get 5 cases
	And 5 of them are cases in status "New"
	And 0 of them are cases in status "Old"

  Scenario Outline: I can create a case
	Given a type of "<type>" with a description of "<description>" is in the database
	And a case description of "<description>"
	And a case status of "New"
	When I save the case
	Then I get the case back
	And the case is in the database

	Examples:
	  | type | description        | description             |
	  | case | Customer Complaint | This is a person        |
	  | case | Sales Negotiation  | This is an organization |
	  | case | Sales Negotiation  |                         |

  Scenario: I can read a case by id
	Given a type of "case" with a description of "Customer Complaint" is in the database
	And a case description of "This is a case description"
	And a case status of "New"
	And the case is saved to the database
	When I search for the case by id
	Then I get the case back


  Scenario: I can update a case
	Given a type of "case" with a description of "Customer Complaint" is in the database
	And a case description of "This is a case description"
	And a case status of "New"
	And the case is saved to the database
	When I update the case description to "this is a new question"
	Then I get the case back
	And the case is in the database

  Scenario: I can delete a case
	Given a type of "case" with a description of "Customer Complaint" is in the database
	And a case description of "This is a case description"
	And a case status of "New"
	And the case is saved to the database
	When I delete the case
	Then I get "true" back
	And the case is not in the database
