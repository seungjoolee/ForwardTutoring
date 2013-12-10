Feature: student viewing comments for a resource
  As a student of the website
  So that I can view the questions of other students and the answers of tutors
  I want to read posted comments regarding a specific resource

Background: comments have been added to database
  Given the subjects are set up
  And the following resources exist:
  | title                         | posted_by | link | description   | topic  |
  | title                         |  jack     | ww   | jack          | Proofs |
  | Basic Algebra                 |  jack     | ww   | jack          | Proofs |
  | English and the Language      |  jack     | ww   | jack          | Proofs |
  | World Geography for 7th Grade |  jack     | ww   | jack          | Proofs |
  | Quantum Computing             |  jack     | ww   | jack          | Proofs |

  Given the following reviews exist:
  | resource                         | content                                       | rating | user | anonymous |
  | Basic Algebra                    | Very helpful!                                 | 1      | jack | true      | 
  | Basic Algebra                    | Is it possible to show more examples?         | 2      | jack | true      |
  | Basic Algebra                    | Could anyone elaborate more on Q2?            | 3      | jack | false     |
  | English and the Language         | Thank you so much! You saved me life!         | 4      | jack | false     |
  | Quantum Computing                | Hardcore stuff!!                              | 5      | jack | true      |

  And I am on the ForwardTutoring resource page

Scenario: View all the reviews under Basic Algebra
  When I go to the details resource page for "Basic Algebra"
  Then I should see the following reviews: "Very helpful!", "Is it possible to show more examples?", "Could anyone elaborate more on Q2?"
  And I should not see the following reviews: "Thank you so much! You saved me life!", "Hardcore stuff!!"

Scenario: View all the reviews under English and the Language 
  When I go to the details resource page for "English and the Language"
  Then I should see the following reviews: "jack"
  And I should not see the following reviews: "Anonymous"

Scenario: View all the reviews under Quantum Computing 
  When I go to the details resource page for "Quantum Computing"
  Then I should not see the following reviews: "jack"
  And I should see the following reviews: "Anonymous"

Scenario: View all the reviews under World Geography
  When I go to the details resource page for "World Geography for 7th Grade" 
  Then I should not see the following reviews: Very helpful!, Is it possible to show more examples?, Could anyone elaborate more on Q2?, Thank you so much! You saved me life!, Hardcore stuff!!
