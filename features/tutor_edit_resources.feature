Feature: Students can view a single detailed resource #

  As a student of the website
  So that I can determine whether to use a resource
  I want to view the details of that resource 

Background: resources table is populated
  Given the subjects are set up
  And I am logged in

  And the following resources exist: 
  | title    | link              | description   | topic  |
  | Google   | http://google.com | A google site | Proofs |

Scenario: Successful Edit Resource
 When I am on the details resource page for "Google"
 Then I am on the details resource page for "Google"
 When I pressy "#edit_id"
 Then I should see "Hello"
 Then I should be on the edit resource page for "Google"

 When I fill in "resource_description" with "Hello world"
 And I press "Submit"
 Then I should be on the details resource page for "Google"
 And I should see "Hello world"

Scenario: Unsuccessful Edit Resource by incorrect link
 When I am on the details resource page for "Google"

 And I follow "Edit"
 Then I should be on the edit resource page for "Google"
 When I fill in "resource_link" with "http:yahoo.com"
 And I press "Submit"
 Then I should be on the edit resource page for "Google"
 Then I should see in the header "Link is invalid."

Scenario: Unsuccessful Edit Resource by no link
 When I am on the details resource page for "Google"
 And I follow "Edit"
 Then I should be on the edit resource page for "Google"
 When I fill in "resource_link" with ""
 And I press "Submit"
 Then I should be on the edit resource page for "Google"
 Then I should see in the header "Specify either a pdf or link"

