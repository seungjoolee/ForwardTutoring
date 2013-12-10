Given /I am logged in/ do
  visit '/log_in'
  fill_in('session_name', :with => "Tutor")
  fill_in('session_password', :with => "tutor$123")
  click_button("commit")
  end
