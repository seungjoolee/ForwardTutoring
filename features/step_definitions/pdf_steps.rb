When /^I upload the file "(.*)"$/ do |filename|
    attach_file(:pdf, File.join(RAILS_ROOT, 'features', 'upload-files', filename))
  end
