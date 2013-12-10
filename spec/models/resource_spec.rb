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
      puts resource
      resource.should_not be_valid
    end

    it "should error with an long title" do
      long_title = Hash[@resource_hash]
      long_title[:title] = "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
      resource = Resource.new(long_title)
      resource.should_not be_valid
    end

    it "should error with an long link" do
      long_link = Hash[@resource_hash]
      long_link[:link] = "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
      resource = Resource.new(long_link)
      resource.should_not be_valid
    end

    it "should error with an long link" do
      long_description = Hash[@resource_hash]
      long_description[:description] = "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
      resource = Resource.new(long_description)
      resource.should_not be_valid
    end

    it "should error with both pdf and link empty" do
      empty_pdfandlink = Hash[@resource_hash]
      empty_pdfandlink[:pdf] = ""
      empty_pdfandlink[:link] = ""
      resource = Resource.new(empty_pdfandlink)
      resource.should_not be_valid
    end

    #it "should pick only 1 of the link or the file"
      #both_pdfandlink = Hash[@resource_hash]
      #both_pdfandlink[:pdf] = "google.pdf"
      #resource = Resource.new(both_pdfandlink)
      #resource.should_not be_valid
   # end
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
