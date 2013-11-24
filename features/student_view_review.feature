Feature: student viewing comments for a resource
  As a student of the website
  So that I can view the questions of other students and the answers of tutors
  I want to read posted comments regarding a specific resource

Background: comments have been added to database

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

  Given the following reviews exist:
  | resource                         | content                                       | rating | user |
  | Basic Algebra                    | Very helpful!                                 | 1 | jack |
  | Basic Algebra                    | Is it possible to show more examples?         | 2 | jack |
  | Basic Algebra                    | Could anyone elaborate more on Q2?            | 3 | jack |
  | English and the Language         | Thank you so much! You saved me life!         | 4 | jack |
  | Quantum Computing                | Hardcore stuff!!                              | 5 | jack |

  And I am on the ForwardTutoring resource page

Scenario: View all the reviews under Basic Algebra
  When I go to the details resource page for "Basic Algebra"
  Then I should see the following reviews: "Very helpful!", "Is it possible to show more examples?", "Could anyone elaborate more on Q2?"
  And I should not see the following reviews: "Thank you so much! You saved me life!", "Hardcore stuff!!"

Scenario: View all the reviews under World Geography
  When I go to the details resource page for "World Geography for 7th Grade" 
  Then I should not see the following reviews: Very helpful!, Is it possible to show more examples?, Could anyone elaborate more on Q2?, Thank you so much! You saved me life!, Hardcore stuff!!
