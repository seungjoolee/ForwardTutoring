Feature: student viewing comments for a resource
  As a student of the website
  So that I can view the questions of other students and the answers of tutors
  I want to read posted comments regarding a specific resource

Background: comments have been added to database

  Given the following resources exist:
  | title                            | link |
  | Basic Algebra                    | ww |
  | English and the Language         | ww |
  | World Geography for 7th Grade    | ww |
  | Quantum Computing                | ww |

  Given the following ratings exist:
  | title                            | comments                                      |
  | Basic Algebra                    | Very helpful!                                 |
  | Basic Algebra                    | Is it possible to show more examples?         |
  | Basic Algebra                    | Could anyone elaborate more on Q2?            |
  | English and the Language         | Thank you so much! You saved me life!         |
  | Quantum Computing                | Hardcore stuff!!                              |

  And I am on the ForwardTutoring resource page

Scenario: View all the comments under Basic Algebra
  When I go to "Basic Algebra" page
  Then I should see the following comments: "Very helpful!", "Is it possible to show more examples?", "Could anyone elaborate more on Q2?"
  And I should not see the following comments: "Thank you so much! You saved me life!", "Hardcore stuff!!"

Scenario: View all the comments under Basic Algebra
  When I go to "World Geography for 7th Grade" page
  Then I should not see the following comments: Very helpful!, Is it possible to show more examples?, Could anyone elaborate more on Q2?, Thank you so much! You saved me life!, Hardcord stuff!!
