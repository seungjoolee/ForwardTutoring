When /^(?:|I )login using "([^"]*)" and "([^"]*)"$/ do |field, value|
  fill_in('admin_user[email]', :with => field)
  fill_in('admin_user[password]', :with => value)
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    AdminUser.create!(user)
  end
end

When /^I click "(.*)" in the table next to the field "(.*)"$/ do |field, value|
  id = Field.find_by_title(value).id
  within("tr#field_#{id}") do
  click_link(field)
  end
end

When /^I click "(.*)" in the table next to the topic "(.*)"$/ do |topic, value|
  id = Topic.find_by_title(value).id
  within("tr#topic_#{id}") do
    click_link(topic)
  end
end

When /^I click "(.*)" in the table next to the subject "(.*)"$/ do |subject, value|
  id = Subject.find_by_title(value).id
  within("tr#subject_#{id}") do
  click_link(subject)
  end
end
