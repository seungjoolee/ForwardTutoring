Feature: student search for resources
  As a student of the website
  So that I can easily find a specific type study resources
  I want to have a search function to quickly find tutoring resources

Background: resources have been added to database
	    
Given the subjects are set up

        And the following resources exist: 
  | title    | posted_by | link              | description   | topic  |
  | Google   | John      | http://google.com | A google site | Proofs |
  | Yahoo    | Jack      | http:yahoo.com    | A yahoo site  | Triangles |


Scenario: Search for nonexistent resources in the field page
  Given I am on the field page for "Geometry"
  When I fill in "search" with "Error"
  Then I should be on the field page for "Geometry"
  And I should see "Google"
  And I should see "Yahoo"

Scenario: Successfully Search for resources in the field page
  Given I am on the field page for "Geometry"
  When I fill in "search" with "Goog"
  Then I should be on the field page for "Geometry"
  And I should see "Google"
  And I should not see "Yahoo"