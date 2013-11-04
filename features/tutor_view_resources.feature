Feature: Tutor Viewing resources
 As a Tutor of Forward Tutoring
 So that I can see the effectiveness of my own resources and improve them, I want to view and edit my current resources with the ratings from students.

Background: resources table is populated
  Given the following Resources Exist: 
| title      | description            |  summary      |
| Google     | http://google.com      | A google site |

Scenario: View Resources
  When I am on the Resources Page
  Then I should see the "Google" resource

#Scenario: Edit resources
#  When I am on the Resources Page
#  And I follow the "Edit Google Page"
#  Then I should be on the "Google edit resources" page

