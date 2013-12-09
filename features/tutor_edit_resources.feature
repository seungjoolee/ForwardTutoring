Feature: Students can view a single detailed resource

  As a student of the website
  So that I can determine whether to use a resource
  I want to view the details of that resource 

Background: resources table is populated
  Given the subjects are set up

  And the following resources exist: 
  | title    | posted_by | link              | description   | topic  |
  | Google   | John      | http://google.com | A google site | Proofs |
  | Yahoo    | Jack      | http:yahoo.com    | A yahoo site  | Proofs |

Scenario: Successful Edit Resource
When I am on the details resource page for "Google"
And I follow "Edit"
Then I should be on the edit resource page for "Google"
When I fill in "resource_description" with "Hello world"
And I press "Submit"
Then I should be on the details resource page for "Google"
And I should see "Hello world"


Scenario: Unsuccessful Edit Resource by no link
When I am on the details resource page for "Google"
And I follow "Edit"
Then I should be on the edit resource page for "Google"
When I fill in "resource_link" with ""
And I press "Submit"
Then I should be on the edit resource page for "Google"
Then I should see in the header "Specify either a pdf or link"

