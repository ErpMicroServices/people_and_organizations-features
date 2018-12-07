Feature: Types can be create, updated and deleted
  As a user of the People and Organization Entity Domain
  I want to manage types
  So that I can manage various types of things in the domain

  @party_database
  Scenario Outline: Create a type
	Given a type of "<type>"
	Given a type with a description of "<description>"
	When I save the type
	Then the type is in the database

	Examples:
	  | type                        | description   |
	  | party                       | Chester       |
	  | party classification        | Super huge    |
	  | party role                  | ChesterTester |
	  | party relationship          | Customer      |
	  | priority                    | High          |
	  | party relationship status   | b0rken        |
	  | geographic boundary         | county        |
	  | contact mechanism           | phone         |
	  | communication event purpose | fun           |
	  | communication event role    | participant   |
	  | communication event status  | over          |
	  | case status                 | done          |
	  | case role                   | participant   |
	  | communication event         | phone call    |
	  | facility                    | warehouse     |
	  | facility role               | destination   |
	  | name                        | first name    |
	  | id                          | 123456xyz     |
	  | case                        | complaint     |
	  | case status                 | new           |

  @party_database
  Scenario Outline: Read a type by description
	Given a type of "<type>" with a description of "<description>" is in the database
	When I search for the type by the description "<description>"
	Then I find the type
	Examples:
	  | type                        | description   |
	  | party                       | Chester       |
	  | party classification        | Super huge    |
	  | party role                  | ChesterTester |
	  | party relationship          | Customer      |
	  | priority                    | High          |
	  | party relationship status   | b0rken        |
	  | geographic boundary         | county        |
	  | contact mechanism           | phone         |
	  | communication event purpose | fun           |
	  | communication event role    | participant   |
	  | communication event status  | over          |
	  | case status                 | done          |
	  | case role                   | participant   |
	  | communication event         | phone call    |
	  | facility                    | warehouse     |
	  | facility role               | destination   |
	  | name                        | first name    |
	  | id                          | 123456xyz     |
	  | case                        | complaint     |
	  | case status                 | new           |

  @party_database
  Scenario Outline: Update a type
	Given a type of "<type>" with a description of "<description>" is in the database
	When I update the description of the type to "<udpated description>"
	Then the type description has been updated
	Examples:
	  | type                        | description   | udpated description   |
	  | party                       | Chester       | update Chester        |
	  | party classification        | Super huge    | update  Super huge    |
	  | party role                  | ChesterTester | update  ChesterTester |
	  | party relationship          | Customer      | update  Customer      |
	  | priority                    | High          | update  High          |
	  | party relationship status   | b0rken        | update  b0rken        |
	  | geographic boundary         | county        | update  county        |
	  | contact mechanism           | phone         | update  phone         |
	  | communication event purpose | fun           | update  fun           |
	  | communication event role    | participant   | update  participant   |
	  | communication event status  | over          | update  over          |
	  | case status                 | done          | update  done          |
	  | case role                   | participant   | update  participant   |
	  | communication event         | phone call    | update  phone call    |
	  | facility                    | warehouse     | update  warehouse     |
	  | facility role               | destination   | update  destination   |
	  | name                        | first name    | update first name     |
	  | id                          | 123456xyz     | update 123456xyz      |
	  | case                        | complaint     | update complaint      |
	  | case status                 | new           | update new            |

  @party_database
  Scenario Outline: Delete a party role type
	Given a type of "<type>" with a description of "<description>" is in the database
	When I delete the type
	Then the type is not in the database
	Examples:
	  | type                        | description   |
	  | party                       | Chester       |
	  | party classification        | Super huge    |
	  | party role                  | ChesterTester |
	  | party relationship          | Customer      |
	  | priority                    | High          |
	  | party relationship status   | b0rken        |
	  | geographic boundary         | county        |
	  | contact mechanism           | phone         |
	  | communication event purpose | fun           |
	  | communication event role    | participant   |
	  | communication event status  | over          |
	  | case status                 | done          |
	  | case role                   | participant   |
	  | communication event         | phone call    |
	  | facility                    | warehouse     |
	  | facility role               | destination   |
	  | name                        | first name    |
	  | id                          | 123456xyz     |
	  | case                        | complaint     |
	  | case status                 | new           |

  @party_database
  Scenario Outline: I can create a child of a party role type
	Given a type of "<type>" with a description of "<description>" is in the database
	When I add a child type with a description of "<child description>"
	Then I can find the parent of the child  of the type
	Examples:
	  | type                        | description   | child description   |
	  | party                       | Chester       | Child Chester       |
	  | party classification        | Super huge    | child Super huge    |
	  | party role                  | ChesterTester | child ChesterTester |
	  | party relationship          | Customer      | child Customer      |
	  | priority                    | High          | child High          |
	  | party relationship status   | b0rken        | child b0rken        |
	  | geographic boundary         | county        | child county        |
	  | contact mechanism           | phone         | child phone         |
	  | communication event purpose | fun           | child fun           |
	  | communication event role    | participant   | child participant   |
	  | communication event status  | over          | child over          |
	  | case status                 | done          | child done          |
	  | case role                   | participant   | child participant   |
	  | communication event         | phone call    | child phone call    |
	  | facility                    | warehouse     | child warehouse     |
	  | facility role               | destination   | child destination   |
	  | name                        | person name   | first name          |
	  | id                          | 123456xyz     | 123456xyz-2         |
	  | case                        | complaint     | child complaint     |
	  | case status                 | new           | child new           |


  @party_database
  Scenario Outline: I can read a parent, and get the children
	Given a type of "<type>" with a description of "<description>" is in the database
	And I add a child type with a description of "ChesterTester Child"
	When I search for the parent type
	Then I find the type
	And I find the child type

	Examples:
	  | type                        | description   |
	  | party                       | Chester       |
	  | party classification        | Super huge    |
	  | party role                  | ChesterTester |
	  | party relationship          | Customer      |
	  | priority                    | High          |
	  | party relationship status   | b0rken        |
	  | geographic boundary         | county        |
	  | contact mechanism           | phone         |
	  | communication event purpose | fun           |
	  | communication event role    | participant   |
	  | communication event status  | over          |
	  | case status                 | done          |
	  | case role                   | participant   |
	  | communication event         | phone call    |
	  | facility                    | warehouse     |
	  | facility role               | destination   |
	  | name                        | first name    |
	  | id                          | 123456xyz     |
	  | case                        | complaint     |
	  | case status                 | new           |
