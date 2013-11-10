require 'spec_helper'
describe Resource do

  describe "new" do
    before do
      @resource_hash = {title: "Algebra", posted_by: "Kent", link: "google.com", category: "math"}
    end

    it "should error with a nil title" do
      empty_title = Hash.new(@resource_hash)
      empty_title.delete(:title)
      resource = Resource.new(empty_title)
      resource.should_not be_valid
  end

    it "should error with a blank title" do
      empty_title = Hash.new(@resource_hash)
      empty_title[:title] = ""
      resource = Resource.new(empty_title)
      resource.should_not be_valid
    end

it "should error without a category" do
      empty_title = Hash.new(@resource_hash)
      empty_title.delete(:category)
      resource = Resource.new(empty_title)
      resource.should_not be_valid
    end


    it "should error with a blank link or file" do
      empty_title = Hash.new(@resource_hash)
      empty_title.delete(:link)
      resource = Resource.new(empty_title)
      resource.should_not be_valid
    end

    it "should pick only 1 of the link or the file"
  end

  describe "belonging to a topic" do
    it "should belong to a topic"
    it "should return resources where topic is under the category"
  end

  describe "having many reviews" do
    it "should return reviews that belong to it"
  end
end
