Feature: student viewing comments for a resource
  As a student of the website
  So that I can view the questions of other students and the answers of tutors
  I want to read posted comments regarding a specific resource

Background: comments have been added to database

  Given the following resources exist:
  | title                            | category | rating | release_date |
  | Basic Algebra                    | Math     | 4      | 10-Jun-2013  |
  | English and the Language         | English  | 2      | 11-Jul-2013  |
  | World Geography for 7th Grade    | Null     | 3      | 12-Oct-2013  |
  | Quantum Computing                | Null     | 5      | 13-Nov-2013  |

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
