Feature: Posting Study Materials
  As a tutor of Forward Tutoring
  So that students can see content and learn while I am offline
  I want to post links and files into a resources page

Background: on the new resource page with topics populated 
  Given the subjects are set up
  Given I am logged in

  And I am on the new resource page


Scenario: No topic in new resources
  And I fill in "resource_description" with "No link to google.com"
  And I fill in "resource_link" with "http://www.google.com"
  And I press "Submit"
  Then I should see in the header "Topic should not be blank"
  And I should be on the new resource page
  And I should see in "resource_description", "No link to google.com"
  And I should see in "resource_link", "http://www.google.com"



Scenario: No title in new resources
  When I select "Proofs" from drop-down resource_topic_id menu
  And I fill in "resource_description" with "No link to google.com"
  And I fill in "resource_link" with "http://www.google.com"
  And I press "Submit"
  Then I should see in the header "Title should not be blank"
  And I should be on the new resource page
  And I should see "Proofs"
  And I should see in "resource_description", "No link to google.com"
  And I should see in "resource_link", "http://www.google.com"

Scenario: No link in new resources
  When I select "Proofs" from drop-down resource_topic_id menu
  When I fill in "resource_title" with "Google"
  And I fill in "resource_description" with "No link to google.com"
  And I press "Submit"
  Then I should be on the new resource page
  And I should see in the header "Specify either a pdf or link"
  And I should see "Proofs"
  And I should see in "resource_title", "Google"
  And I should see in "resource_description", "No link to google.com"

Scenario:Successfully Post Link into Resources Page
  When I select "Proofs" from drop-down resource_topic_id menu
  When I fill in "resource_title" with "Google"
  And I fill in "resource_description" with "a link to Google"
  And I fill in "resource_link" with "http://www.google.com"
  And I press "Submit"
  Then I should be on the details resource page for "Google" 
  #Then I should be on the "Proofs" topic page

  #Then I should see the "Google" resource

Scenario:Successfully Post Link into Resources Page and should be on the same topic page
  When I select "Proofs" from drop-down resource_topic_id menu
  When I fill in "resource_title" with "Area"
  And I fill in "resource_description" with "a link to Area"
  And I fill in "resource_link" with "http://www.area.com"
  And I press "Submit"
  #Then I should be on the "Proofs" topic page
  #And I should see the "Area" resource
  #When I follow the "Area" link
  Then I should be on the details resource page for "Area"


Scenario: Successfully Post File into Resources Page
  When I select "Proofs" from drop-down resource_topic_id menu
  And I fill in "resource_title" with "Math File"
  And I fill in "resource_description" with "No link to google.com"
  #And I fill in "Title" with "Math File"
  And I upload the file "test.txt"
  And I press "Submit"
  Then I should be on the details resource page for "Math File" 
  When I follow "test.txt"
  #Then I should be on the pdf resource page for "Math File"
  Then I should see "Jackpot!"




Scenario: Post invalid File into Resources Page
  When I select "Proofs" from drop-down resource_topic_id menu
  And I fill in "resource_title" with "Virus File"
  And I fill in "resource_description" with "No link to google.com"
  And I upload the file "fake_virus.exe"
  And I press "Submit"
  Then I should be on the new resource page
  Then I should see "Only PDF, WORD, EXCEL, or TEXT files are allowed"
  And I should see "Proofs"
  And I should see in "resource_title", "Virus File"
  # And I should see in "resource_posted_by", "Jack"
  # And I should see in "resource_description", "No link to google.com"


