When /^(?:|I )login using "([^"]*)" and "([^"]*)"$/ do |field, value|
  fill_in('admin_user[email]', :with => field)
  fill_in('admin_user[password]', :with => value)
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    AdminUser.create!(user)
  end
end