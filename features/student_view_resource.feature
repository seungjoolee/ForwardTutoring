Feature: Students can view a single detailed resource

  As a student of the website
  So that I can determine whether to use a resource
  I want to view the details of that resource 

Background: resources table is populated



  Given the following topics exist: 
  | title    |
  | Proofs   |
  | Angles   |


  And the following resources exist: 
  | title    | posted_by | link              | description   | topic  |
  | Google   | John      | http://google.com | A google site | Proofs |
  | Yahoo    | Jack      | http:yahoo.com    | A yahoo site  | Proofs |

Scenario: View resource
When I am on the Resources page
Then I should see the "Google" resource
When I follow the "Google" link
Then I should be on the details resource page for "Google"
And I should see "John"
And I should see "A google site"
And I should see "http://google.com"
  
Scenario: Try to view a resource that does not exist
  When I am on the nonexistent details resource page
  Then I should be on the Resources page
  And I should see "This resource does not exist"
