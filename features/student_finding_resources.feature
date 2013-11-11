Feature: student finding resources
  As a student of the website
  So that I can easily find study resources
  I want to have a clear navigation of how to find resources

Background: resources have been added to database
  Given the subjects are set up

Scenario: Get to the Proofs page under Geometry
  Given I am on the subjects page
  Then I should see "Math"
  When I follow "Geometry"
  Then I should see "Proofs"
  When I follow "Proofs"
  Then I should be on the "Proofs" topic page

Scenario: Navigating to the wrong subject and going back
  Given I am on the subjects page
  When I follow "Chemistry"
  Then I should not see "Geometry"
  When I follow "Science"
  Then I should be on the subjects page


