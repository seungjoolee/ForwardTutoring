

Given /the following resources exist/ do |resources_table|
  resources_table.hashes.each do |resource|
    Resource.create!(resource)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end

# When /I upload a file "(.*)"/ do |file|

 # end



Then /^I should (not )?see the "(.*)" resource$/ do |unseen, resource_list|  if unseen
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

Then /I should (not )?see the following comments: (.*)/ do |unseen, comment_list|
  comment_list.split(',').collect(&:strip).each do |comment|
    if unseen
      if page.respond_to? :should
        page.should have_no_content(comment)
      else
        assert page.has_no_content?(comment)
      end
    else
      if page.respond_to? :should
        page.should have_content(comment)
      else
        assert page.has_content?(comment)
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
