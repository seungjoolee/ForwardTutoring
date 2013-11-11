Feature: Posting Study Materials
  As a tutor of Forward Tutoring
  So that students can see content and learn while I am offline
  I want to post links and files into a resources page

Background: on the new resource page
  Given I am on the new resource page
  
Scenario: No title in new resources
  When I fill in "resource_posted_by" with "Jack" 
  And I fill in "resource_description" with "No link to google.com"
  And I fill in "resource_link" with "http://www.google.com"
  And I press "Submit"
  Then I should see in the header "Title should not be blank"
  And I should be on the new resource page
  And I should see in "resource_posted_by", "Jack"
  And I should see in "resource_description", "No link to google.com"
  And I should see in "resource_link", "http://www.google.com"

Scenario: No link in new resources
  When I fill in "resource_title" with "Google"
  And I fill in "resource_posted_by" with "Jack" 
  And I fill in "resource_description" with "No link to google.com"
  And I press "Submit"
  Then I should see in the header "Link should not be blank"
  And I should be on the new resource page
  And I should see in "resource_title", "Google"
  And I should see in "resource_posted_by", "Jack"
  And I should see in "resource_description", "No link to google.com"

Scenario:Successfully Post Link into Resources Page
  When I fill in "resource_title" with "Google"
  And I fill in "resource_posted_by" with "Jack"
  And I fill in "resource_description" with "a link to Google"
  And I fill in "resource_link" with "http://www.google.com"
  And I press "Submit"
  Then I should be on the Resources page
  And I should see the "Google" resource

#Scenario: Successfully Post File into Resources Page
#  When I fill in "resource_title" with "Math File"
#  And I fill in "resource_posted_by" with "Jack"
#  And I fill in "resource_description" with "No link to google.com"
#When I fill in "Title" with "Math File"
#  And I upload the file "TestFile.pdf"
#  And I press "Submit"
#  Then I should see "Error: No Link or file posted yet"
  

#Scenario: Post invalid File into Resources Page
#  When I fill in "resource_title" with "Math File"
#  And I fill in "resource_posted_by" with "Jack"
#  And I fill in "resource_description" with "No link to google.com"
#  When I fill in "Title" with "Math File"
#  And I upload the file "virus.exe"
#  And I press "Submit"
#  Then I should see "Error: Invalid uploaded File"


  