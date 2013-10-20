Feature: Posting Comments for materials
  As a tutor of the website
  So that I can answer questions regarding the resources
  I want to post comments for  students to see and reply to.

Scenario: Post comment under basic Algebra
  Given I am on the "Basic Algebra" page
  And I am the owner of "Basic Algebra"
  When I put "Hi" into the comments textfield
  And I press "submit"
  Then I should see the following comments: "Hi"
  And I should see the "Tutor" next to the "Hi" comment

