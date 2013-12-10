Feature: Posting Reviews for materials
  As a student of the website
  So that I can ask questions, provide feedback regarding the resources
  I want to post reviews for both other students and tutors to see and reply to and rate resources based on a 5 point rating system




Background: resources have been added to database
  Given the subjects are set up

  And the following resources exist:
  | title                         | posted_by | link         | description   | topic  |
  | Basic Algebra                 |  jack     | http://google.com   | jack          | Proofs |
  | English and the Language      |  jack     | google.com   | jack          | Proofs |
  | World Geography for 7th Grade |  jack     | google.com   | jack          | Proofs |
  | Quantum Computing             |  jack     | google.com   | jack          | Proofs |

  And I am on the ForwardTutoring resource page


Scenario: Post review under basic Algebra
  Given I am on the details resource page for "Basic Algebra"
  When I fill in "review_user" with "Keith"
  And I fill in "review_content" with "Hi" 
  And I press "Submit"
  Then I should see "Keith"
  Then I should see "Hi"

  
Scenario: Post blank review under basic Algebra
  Given I am on the details resource page for "Basic Algebra"
  When I fill in "review_user" with "Keith"
  And I press "Submit"
  Then I should see "Content should not be blank"

