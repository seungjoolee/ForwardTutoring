Feature: student sorting for resources
  As a student of the website
  So that I can easily find the best of a type of resources
  I want to have a sort function to quickly find tutoring resources

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

Scenario: Sort resources in a descending order of rating
#  When I follow "Date"
#  Then all the resources should be sorted by rating

Scenario: Sort resources in a descending order of release date
#  When I follow "Highest Rating"
 # Then all the resources should be sorted by release date