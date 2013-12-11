Feature: Students can view a single detailed resource

  As a student of the website
  So that I can determine whether to use a resource
  I want to view the details of that resource 

Background: resources table is populated
  Given the subjects are set up
  And I am logged in

  And the following resources exist: 
  | title    |link              | description   | topic  |
  | Google   |http://google.com | A google site | Proofs |
  | Yahoo    | http://yahoo.com    | A yahoo site  | Proofs |

Scenario: View resource
  When I am on the topic page for "Proofs"
  Then I should see "Google"
  When I follow the "Google" link
  Then I should be on the details resource page for "Google"
  And I should see "A google site"
  And I should see "http://google.com"
  
Scenario: Try to view a resource that does not exist
  When I am on the nonexistent details resource page
  Then I should be on the subjects page
  And I should see "This resource does not exist"

