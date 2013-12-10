Feature: User Login On Website
  As a user of ForwardTutoring
  So that I can use my existing account for tutoring resources
  I want to be able to login

Background: on the new resource page with topics populated 

  Given I am logged in
  Given the following accounts exist: 
  | name     | email 			| password | 
  | John     | john@hotmail.com         | john	   |

  And I am on the home page

Scenario: Login to the website using existing account
  When I click "Login" in the navbar
  And I fill in "email" with "john@hotmail.com"
  And I fill in "password" with "john"
  And I press "Submit"
  Then I should see in "flash_message", "Login successful"
  
Scenario: Login to the website using wrong information
  When I click "Login" in the navbar
  And I fill in "email" with "john@hotmail.com"
  And I fill in "password" with "johna"
  And I press "Submit"
  Then I should see in "error_message", "Error: username or password is invalid"



