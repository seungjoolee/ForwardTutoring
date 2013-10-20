Feature: Posting Comments for materials
  As a student of the website
  So that I can ask questions, provide feedback regarding the resources
  I want to post comments for both other students and tutors to see and reply to.


Background: resources have been added to database

  Given the following resources exist:
  | title                            | category | rating | release_date |
  | Basic Algebra                    | Math     | 4      | 10-Jun-2013  |
  | English and the Language         | English  | 2      | 11-Jul-2013  |
  | World Geography for 7th Grade    | Null     | 3      | 12-Oct-2013  |
  | Quantum Computing                | Null     | 5      | 13-Nov-2013  |

  And I am on the ForwardTutoring resource page

Scenario: Post comment under basic Algebra
  Given I am on the "Basic Algebra" page
  When I put "Hi" into the comments textfield
  And I press "submit"
  Then I should see the following comments: "Hi"

  