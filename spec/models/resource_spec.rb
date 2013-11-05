require 'spec_helper'
describe Resource do

  it "should error with a nil title", pending: true do
    resource_hash = {title: "", author: "Kent", link: "google.com"}
    lambda {Resource.create!(resource_hash)}.should raise_error(ValidationError)
  end

  it "should error with a blank title", pending: true do
    resource_hash = {title: "", author: "Kent", link: "google.com"}
    lambda {Resource.create!(resource_hash)}.should raise_error(ValidationError)
    end

  it "should error with a blank link or file"
   it "should pick only 1 of the link or the file"

end
