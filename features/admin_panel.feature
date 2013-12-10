Feature: Admin Panel On Website
  As an admin on ForwardTutoring
  So that I can control the topics available for tutoring resources
  I want to be able to edit the subjects, fields and topics.

Background: on the Admin page

  Given the following users exist:
  | email             | password  |
  | admin@example.com | password  |

  Given the following subjects exist: 
  | title    | 
  | Math     |

  And the following fields exist: 
  | title    | subject |
  | Geometry | Math    |

  And the following topics exist: 
  | title    | field    |
  | Proofs   | Geometry |
  | Angles   | Geometry |

Scenario: Add a new subject
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  Then I should see "Subjects"
  When I click "Subjects"
  And I click "New Subject"
  And I fill in "Title" with "Social Studies"
  And I click "Create Subject"
  Then I should see "Subject was successfully created"

Scenario: Edit an existing subject
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  When I click "Subjects"
  And I click "Edit" in the table next to the subject "Math"
  And I fill in "Title" with "Social Studies"
  And I click "Update Subject"
  Then I should see "Subject was successfully updated"

Scenario: Add a new field
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  When I click "Fields"
  And I click "New Field"
  And I fill in "Title" with "Algebra"
  And I select "Math" from drop-down field_subject_id menu
  And I click "Create Field"
  Then I should see "Field was successfully created"

Scenario: Edit an existing field
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  When I click "Fields"
  And I click "Edit" in the table next to the field "Geometry"
  And I fill in "Title" with "Algebra II"
  And I click "Update Field"
  Then I should see "Field was successfully updated"

Scenario: Add a new topic
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  When I click "Topics"
  And I click "New Topic"
  And I select "Geometry" from drop-down topic_field_id menu
  And I fill in "Title" with "Triangles"
  And I fill in "Description" with "Triangles have three sides. They are a core component to most linear shapes."
  And I click "Create Topic"
  Then I should see "Topic was successfully created"

Scenario: Edit an existing topic
  Given I am on the Admin page
  When I login using "admin@example.com" and "password"
  When I click "Login"
  When I click "Topics"
  And I click "Edit" in the table next to the topic "Proofs"
  And I fill in "Description" with "Proofs are used to take logical steps from one part of geometry to another."
  And I click "Update Topic"
  Then I should see "Topic was successfully updated"