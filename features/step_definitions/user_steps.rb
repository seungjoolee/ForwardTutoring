Given /I am logged in/ do
  visit log_in_path
  fill_in('session_name', :with => "Tutor")
  fill_in('session_password', :with => "tutor$123")
  click_button("commit")
  page.should have_content('Logged in as Tutor')

  end
