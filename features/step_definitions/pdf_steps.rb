When /^I upload the file "(.*)"$/ do |filename|
    attach_file('resource_pdf', File.join(Rails.root, 'features', 'upload-files', filename))
  end
