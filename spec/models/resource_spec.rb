require 'spec_helper'
describe Resource do

  describe "new" do
    before do
      @resource_hash = {title: "Algebra", posted_by: "Kent", link: "google.com", topic_id: "1"}
    end


    it "should pass normally" do
      new_resource = Hash[@resource_hash]
      resource = Resource.new(new_resource)
      resource.should be_valid
  end


    it "should error with a nil title" do
      empty_title = Hash[@resource_hash]
      empty_title.delete(:title)
      resource = Resource.new(empty_title)
      resource.should_not be_valid
  end

    it "should error with an empty title" do
      empty_title = Hash[@resource_hash]
      empty_title[:title] = ""
      resource = Resource.new(empty_title)
      resource.should_not be_valid
    end

it "should error without a topic id" do
      empty_topic = Hash[@resource_hash]
      empty_topic.delete(:topic_id)
      resource = Resource.new(empty_topic)
      resource.should_not be_valid
    end

    it "should error with a blank link or file" do
      empty_link = Hash[@resource_hash]
      empty_link.delete(:link)
      resource = Resource.new(empty_link)
      resource.should_not be_valid
    end

    it "should pick only 1 of the link or the file"
  end

  describe "Associations" do
    it "should belong to a topic" do
      resource = Resource.reflect_on_association(:topic)
      resource.macro.should == :belongs_to
    end

    it "should have many reviews" do
      resource = Resource.reflect_on_association(:reviews)
      resource.macro.should == :has_many
    end
  end
end
