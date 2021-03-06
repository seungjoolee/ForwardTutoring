# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the ForwardTutoring resource page$/
      resources_path

    when /^the subjects page$/
      subjects_path

   when /^the "(.*)" topic page$/
      topic_path(Topic.find_by_title($1))

    when /the topic page for "(.*)"/
      topic_path(Topic.find_by_title($1))

    when /the field page for "(.*)"/
      field_path(Field.find_by_title($1))

    when /^the "(.*)" page/
      resources_path(Resource.find_by_title($1))

    when /^the Resources page$/
      resources_path

    when /^the Admin page$/
      '/admin/'

    when /^the login page$/
      log_in_path

    when /^the new resource page$/
      new_resource_path

    when /^the topic page of "(.*)"$/
      topic_path(Topic.find(Resource.find_by_title($1).topic_id))

    when /^the edit resource page for "(.*)"/
      edit_resource_path(Resource.find_by_title($1))

    when /^the details resource page for "(.*)"/
      resource_path(Resource.find_by_title($1))


    when /the nonexistent details resource page/
      '/resources/-1'


      # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
