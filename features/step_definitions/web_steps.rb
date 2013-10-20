When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )(don't )?fill in keyword "([^"]*)"$/ do |unfill, keyword|
	if !unfill
		fill_in(field, :with => keyword)
	end
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /I select "(.+)" from drop-down (.+) menu/ do |item, field|
	select(value, :from => field)
end