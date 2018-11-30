Feature: As a user
  I want to be able to manage name data about people and groups
  So that I can carry out various business functions

  Scenario Outline: I can create a party with multiple names
	Given a type of "<type>" with a description of "<description>" is in the database
	And a name type of "<party_name_type>" with a name of "<party_name>"
	  | first name | Chester      |
	  | last name  | Tester       |
	  | nickname   | Testy Chesty |
	And a comment of "<comment>"
	When I save the party
	Then I get the party back
	And the party is in the database
	And the party name type is present
	And the party names are present
	Examples:
	  | type  | description  | comment                 |
	  | party | Person       | This is a person        |
	  | party | Organization | This is an organization |

