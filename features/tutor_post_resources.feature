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
  Then I should see "There is no title for this resource yet"
  And I should be 


Scenario: Unsuccessfully Post Anything into Resources Page
  When I fill in "resource_title" with "Google"
  And I fill in "resource_posted_by" with "Jack" 
  And I fill in "resource_description" with "No link to google.com"
  And I press "Submit"
  Then I should see "There is no link for this resource yet"

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


  