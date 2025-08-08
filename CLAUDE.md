# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this module.

## Module Overview

The `people_and_organizations-features` module contains Behavior Driven Development (BDD) feature specifications for the people and organizations domain. This module defines the business requirements and acceptance criteria in Gherkin format, serving as both documentation and executable specifications.

## Technology Stack

- **Specification Language**: Gherkin (Cucumber)
- **Format**: `.feature` files
- **Purpose**: Business requirements documentation and automated testing specifications

## Project Structure

```
people_and_organizations-features/
├── LICENSE                    # Apache 2.0 license
├── README.md                 # Module documentation
└── *.feature                # Gherkin feature specifications
```

## Development Workflow

### Adding New Features
1. **Business Analysis**: Work with stakeholders to understand requirements
2. **Feature Writing**: Create `.feature` files using Gherkin syntax
3. **Review Process**: Validate scenarios with business stakeholders
4. **Integration**: Ensure features align with database and endpoint specifications

### Feature File Standards
```gherkin
Feature: [Business Capability]
  As a [User Role]
  I want to [Business Goal]
  So that [Business Value]

  Background:
    Given [Common Preconditions]

  Scenario: [Specific Business Scenario]
    Given [Initial Context]
    When [Action Taken]
    Then [Expected Outcome]
```

## Gherkin Writing Guidelines

### Scenario Structure
- **Given**: Set up initial state and context
- **When**: Describe the action or event
- **Then**: Define expected outcomes and validations
- **And/But**: Continue the same step type for readability

### Best Practices
- **Business Language**: Use terms familiar to domain experts
- **Declarative Style**: Focus on what, not how
- **Independent Scenarios**: Each scenario should be self-contained
- **Data Tables**: Use for multiple similar test cases
- **Scenario Outlines**: Parameterize similar scenarios

## Integration Points

### Database Integration
- Features must align with database schema in corresponding database module
- Data setup scenarios should match available test data
- Database state validation should be clearly specified

### API Integration
- Features should define expected API behaviors
- Request/response formats should be specified in scenarios
- Error handling and edge cases must be covered

### UI Integration
- User interface behaviors should be described from user perspective
- Screen navigation and user interactions should be clearly defined
- Accessibility and usability requirements should be included

## Testing Integration

### Cucumber Test Execution
- Features are executed by corresponding step definition modules
- Database interactions are tested through appropriate database modules
- API testing is handled by endpoint-specific test implementations

## Quality Standards

### Review Criteria
- **Business Alignment**: Features must represent real business needs
- **Testability**: All scenarios must be implementable as automated tests
- **Clarity**: Features should be understandable by non-technical stakeholders
- **Completeness**: All major user workflows should be covered

### Maintenance Guidelines
- **Version Control**: All changes should be tracked and reviewed
- **Backward Compatibility**: Changes should not break existing scenarios
- **Refactoring**: Regular cleanup of duplicate or obsolete scenarios
- **Living Documentation**: Features should be updated as requirements evolve

## Important Notes

- **Pure Specification**: This module contains only feature files, no implementation code
- **Domain Focus**: Features are specific to people and organizations business processes
- **Executable Documentation**: Features serve as both requirements and test specifications
- **Stakeholder Communication**: Features should be reviewable by business users
