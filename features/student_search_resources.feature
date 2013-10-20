Feature: student search for resources
  As a student of the website
  So that I can easily find study resources
  I want to have a search feature to quickly find tutoring resources

Background: resources have been added to database

  Given the following resources exist:
  | title                            | category | rating | release_date |
  | Basic Algebra                    | Math     | 4      | 10-Jun-2013  |
  | English and the Language         | English  | 2      | 11-Jul-2013  |
  | World Geography for 7th Grade    | Null     | 3      | 12-Oct-2013  |
  | Quantum Computing                | Null     | 5      | 13-Nov-2013  |

  And I am on the ForwardTutoring resource page

Scenario: Search for specific resources with keyword "English"
  When I select "All" from drop-down category menu
  And I fill in keyword "English"
  And I press "Search"
  Then I should see the following resources: English and the Language
  And I should not see the following resources: Basic Algebra, World Geography for 7th Grade, Quantum Computing

Scenario: Search for all resouces under category "Math"
  When I select "Math" from drop-down category menu
  And I don't fill in keyword
  And I press "Search"
  Then I should see the following resources: Basic Algebra
  And I should not see the following resources: English and the Language, World Geography for 7th Grade, Quantum Computing

Scenario: Search for all resourcess
  When I select "All" from drop-down category menu
  And I don't fill in keyword
  And I press "Search"
  Then I should see all the resources
