Feature: As a user
  I want to be able to manage name data about people and groups
  So that I can carry out various business functions

  Scenario: I can create a party with multiple names
	Given the following types:
	  | name | First Name |
	  | name | Last Name  |
	  | name | Nickname   |
	And party names of
	  | First Name | Chester      |
	  | Last Name  | Tester       |
	  | Nickname   | Testy Chesty |
	And a type of "party" with a description of "Person" is in the database
	When I save the party
	Then I get the party back
	And the party is in the database
	And the party name type is present
	And the party names are present

  Scenario: I can add a name to a party
	Given the following types:
	  | party | Person     |
	  | name  | First Name |
	And a party of type "Person" is in the database
	When I add the "First Name" of "Chester Tester" to the party
	Then I get the party name back
	Then the party name is in the database
