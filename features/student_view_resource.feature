Feature: Students can view a single detailed resource

  As a student of the website
  So that I can determine whether to use a resource
  I want to view the details of that resource 

Background: resources table is populated

  Given the following resources exist: 
  | title    | posted_by | link              | description   | 
  | Google   | John      | http://google.com | A google site |
  | Yahoo    | Jack      | http:yahoo.com    | A yahoo site  |

Scenario: View resource
When I am on the Resources page
Then I should see the "Google" resource
When I follow the "Google" link
Then I should be on the "Google" resource page
And I should see "John"
And I should see "A google site"
And I should see "http://google.com"
  
