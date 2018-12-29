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

  Scenario: I can create a case
	Given the following types:
	  | case        | Customer Complaint |
	  | case status | New                |
	And a case description of "This is a case to be created"
	And a case status of "New"
	And a case type of "Customer Complaint"
	When I save the case
	Then I get the case back
	And the case is in the database

  Scenario: I can read a case by id
	Given the following types:
	  | case        | Customer Complaint |
	  | case status | New                |
	And a case description of "This is a case to be read by id"
	And a case status of "New"
	And a case type of "Customer Complaint"
	And the case is saved to the database
	When I search for the case by id
	Then I get the case back


  Scenario: I can update a case
	Given the following types:
	  | case        | Customer Complaint |
	  | case status | New                |
	And a case description of "This is a case update description"
	And a case status of "New"
	And a case type of "Customer Complaint"
	And the case is saved to the database
	When I update the case description to "this is what I updated the case description to"
	Then I get the case back
	And the case is in the database

  Scenario: I can delete a case
	Given the following types:
	  | case        | Customer Complaint |
	  | case status | New                |
	And a case description of "This case is to be deleted"
	And a case status of "New"
	And a case type of "Customer Complaint"
	And the case is saved to the database
	When I delete the case
	Then I get "true" back
	And the case is not in the database
