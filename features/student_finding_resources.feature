Feature: student finding resources
  As a student of the website
  So that I can easily find study resources
  I want to have a clear navigation of how to find resources

Background: resources have been added to database

  Given the following subjects exist:
  | title         |                   
  | Math          |
  | Science       |

  Given the following fields exist:
  | title         | subject |                   
  | Algebra       | Math    |
  | Calculus      | Math    |
  | Chemistry     | Science |                  

  Given the following topics exist:
  | title         | field       |                   
  | Factoring     | Algebra     |
  | Derivatives   | Calculus    |
  | Bonds         | Chemistry   |


Scenario: Find all the topics under Algebra
  When I look under "Math"
  And I press "Algebra"
  Then I should see "Factoring"

Scenario: Navigating to the wrong topic
  When I look under "Science"
  And I press "Chemistry"
  Then I should not see "Derivatives"

Scenario: Find all the topics under Chemistry
  When I look under "Science"
  And I press "Chemistry"
  Then I should see "Bonds"

