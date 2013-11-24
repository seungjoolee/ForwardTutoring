require 'spec_helper'

describe ResourcesHelper do
  describe "getTopicTitle" do
    it "should return the topic title" do
      @mock_topic = double('topic', :title => "hi")
      Topic.should_receive(:find).with(1).and_return(@mock_topic)
      @mock_topic.should_receive(:title)
      getTopicTitle(1)
    end
  end
end


