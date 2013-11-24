Feature: Posting Reviews for materials
  As a student of the website
  So that I can ask questions, provide feedback regarding the resources
  I want to post reviews for both other students and tutors to see and reply to.


Background: resources have been added to database

  Given the following topics exist: 
  | title    |
  | Proofs   |
  | Angles   |

  And the following resources exist:
  | title                         | posted_by | link | description   | topic  |
  | title                         |  jack     | ww   | jack          | Proofs |
  | Basic Algebra                 |  jack     | ww   | jack          | Proofs |
  | English and the Language      |  jack     | ww   | jack          | Proofs |
  | World Geography for 7th Grade |  jack     | ww   | jack          | Proofs |
  | Quantum Computing             |  jack     | ww   | jack          | Proofs |

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

