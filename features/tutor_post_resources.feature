Feature: Posting Study Materials
  As a tutor of Forward Tutoring
  So that students can see content and learn while I am offline
  I want to post links and files into a resources page

Background: on the new resource page
  Given I am on the new resource page

Scenario:Post Link into Resources Page
  When I fill in "resource_title" with "Google"
  And I fill in "resource_author" with "Jack"
  And I fill in "resource_summary" with "http://google.com"
  And I press "Submit"
Then I should be on the Resources page
And I should see the "Google" resource

#Scenario:Post File into Resources Page
#Given I am on the Resources Page
#When I fill in "Title" with "Math File"
#And I upload the file "Test File"
#Then I should see the "Math File" resource
