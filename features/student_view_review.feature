Feature: student viewing comments for a resource
  As a student of the website
  So that I can view the questions of other students and the answers of tutors
  I want to read posted comments regarding a specific resource

Background: comments have been added to database
  Given the subjects are set up
  And I am logged in

  And the following resources exist:
  | title                         | link         | description   | topic  |
  | title                         | google.com   | jack          | Proofs |
  | Basic Algebra                 | google.com   | jack          | Proofs |
  | English and the Language      | google.com   | jack          | Proofs |
  | World Geography for 7th Grade | google.com   | jack          | Proofs |
  | Quantum Computing             | google.com   | jack          | Proofs |

   Given the following reviews exist:
   | resource                         | content                                       | rating |anonymous |
   | Basic Algebra                    | Very helpful!                                 | 1      | true      | 
   | Basic Algebra                    | Is it possible to show more examples?         | 2      | true      |
   | Basic Algebra                    | Could anyone elaborate more on Q2?            | 3      | false     |
   | English and the Language         | Thank you so much! You saved me life!         | 4      | false     |
   | Quantum Computing                | Hardcore stuff!!                              | 5      | true      |

   And I am on the ForwardTutoring resource page

 Scenario: View all the reviews under Basic Algebra
   When I go to the details resource page for "Basic Algebra"
   Then I should see the following reviews: "Very helpful!", "Is it possible to show more examples?", "Could anyone elaborate more on Q2?"
   And I should not see the following reviews: "Thank you so much! You saved me life!", "Hardcore stuff!!"

 Scenario: View all the reviews under English and the Language 
   When I go to the details resource page for "English and the Language"
   And I should not see the following reviews: "Anonymous"

 Scenario: View all the reviews under Quantum Computing 
   When I go to the details resource page for "Quantum Computing"
   And I should see the following reviews: "Anonymous"

 Scenario: View all the reviews under World Geography
   When I go to the details resource page for "World Geography for 7th Grade" 
   Then I should not see the following reviews: Very helpful!, Is it possible to show more examples?, Could anyone elaborate more on Q2?, Thank you so much! You saved me life!, Hardcore stuff!!
