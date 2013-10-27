Feature: Posting Study Materials
  As a tutor of Forward Tutoring
  So that students can see content and learn while I am offline
  I want to post links and files into a resources page
  
Scenario:Post Link into Resources Page
Given I am on the Resources Page
When I fill in "Title" with "Google"
And I fill in "Link URL" with "http://google.com"
And I press "Add Link"
Then I should see the "Google" resource

Scenario:Post File into Resources Page
Given I am on the Resources Page
When I fill in "Title" with "Math File"
And I upload the file "Test File"
Then I should see the "Math File" resource
