Feature: student search for resources
  As a student of the website
  So that I can easily find a specific type study resources
  I want to have a search function to quickly find tutoring resources

Background: resources have been added to database
	    
Given the subjects are set up

        And the following resources exist: 
  | title    | posted_by | link              | description   | topic  |
  | Google   | John      | http://google.com | A google site | Proofs |
  | Yahoo    | Jack      | http:yahoo.com    | A yahoo site  | Proofs |


Scenario: Search for nonexistent resources in the field page
  Given I am on the field page for "Geometry"
  When I fill in "search_text" with "Error"
  And I follow "search_text"
  Then I should be on the "Error Search Results" page
  And I should see "No results Found"

Scenario: Successfully Search for resources in the field page
  Given I am on the field page for "Geometry"
  When I fill in "search_text" with "Google"
  And I follow "search_text"
  Then I should be on the "Google Search Results" page
  And I should see "Google" in the "Search Results"
