Given /the following subjects exist/ do |subjects_table|
  subjects_table.hashes.each do |subject|
    Subject.create!(subject)
  end
end

Given /the following fields exist/ do |fields_table|
  fields_table.hashes.each do |field|
    if not field[:subject].nil?
      field[:subject_id] = Subject.find_by_title(field[:subject]).id
      field.delete('subject')
      end
      Field.create!(field)

  end
end

Given /the following topics exist/ do |topics_table|
  topics_table.hashes.each do |topic|
    if not topic[:field].nil?
    topic[:field_id] = Field.find_by_title(topic[:field]).id
    topic.delete('field')
      end
    Topic.create!(topic)
  end
end

Given /the following resources exist/ do |resources_table|
  resources_table.hashes.each do |resource|
    resource[:topic_id] = Topic.find_by_title(resource[:topic]).id
    resource.delete('topic')
    Resource.create!(resource)
  end
end

# When /I upload a file "(.*)"/ do |file|

 # end

When /^I follow the "(.*)" link/ do |link|
  #resource
  click_link(link)
  end

Then /^I should (not )?see the "(.*)" resource$/ do |unseen, resource|  if unseen
    if page.respond_to? :should
      page.should have_no_content(resource)
    else
      assert page.has_no_content?(resource)
    end
  else
    if page.respond_to? :should
      page.should have_content(resource)
    else
      assert page.has_content?(resource)
    end
  end
end


Then /I should (not )?see the following resources: (.*)/ do |unseen, resource_list|
  resource_list.split(',').collect(&:strip).each do |resource|
    if unseen
      if page.respond_to? :should
        page.should have_no_content(resource)
      else
        assert page.has_no_content?(resource)
      end
    else
      if page.respond_to? :should
        page.should have_content(resource)
      else
        assert page.has_content?(resource)
      end
    end
  end
end

Then /I should (not )?see the following reviews: (.*)/ do |unseen, review_list|
  review_list.split(',').collect(&:strip).each do |review|
    if unseen
      if page.respond_to? :should
        page.should have_no_content(review)
      else
        assert page.has_no_content?(review)
      end
    else
      if page.respond_to? :should
        page.should have_content(review)
      else
        assert page.has_content?(review)
      end
    end
  end
end

Then /^I should see all the resources$/ do
  page.all("div#resources div.resource").count.should == 4
end

Then /all the resources should be sorted by (.+)/ do |sort_option|
  if sort_option == "rating"
    index = "div.rating"
  elsif sort_option == "release date"
    index = "div.date"
  else
    raise ArgumentError, "Sorting Option Undefined: " + sort_option.to_s
  end
  list = page.all("div#resource #{index}")
  assert list == list.sort {|x, y| y <=> x}
end

Then /I should see in the header "(.*)"/ do |val|
  page.should have_content(val)
end


Then /I should see in "(.*)", "(.*)"/ do |field, val|
  find_field(field).value.should == val
end

