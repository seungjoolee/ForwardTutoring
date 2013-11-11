Feature: Viewing Comment system for materials
  As a tutor of the website
  So that I can improve the quality of my resources and gauge confusing concepts
  I want to read comments posted by users about my materials


Scenario: Tutor View any Comment
  Given I am a Tutor
  When I go to "Basic Algebra" page
  Then I should see the following comments: "Very helpful!", "Is it possible to show more examples?", "Could anyone elaborate more on Q2?"
  And I should not see the following comments: "Thank you so much! You saved me life!", "Hardcore stuff!!"

