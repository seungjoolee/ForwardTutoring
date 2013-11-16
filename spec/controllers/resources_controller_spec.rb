require 'spec_helper'
describe ResourcesController do

  describe "Create a resource", :pending => true do
    before do
      @mock_topic = double('topic', :resources => [@mock_resource])
      @mock_resource = double('resource', :errors => nil, :valid? => true, :save! => nil, :title => "Algebra", :link => "algebra.com", :topic => "math")
      @error_resource = double('resource', :errors => nil, :valid? => true, :save! => nil, :title => "Algebra", :link => "algebra.com", :topic => "math")
      @error_resource.stub(:errors => double('error', :full_messages => "error"), :valid? => false)
      @resource_array = {:title => "Algebra", :link => "algebra.com", :resource => {:topic_id => "1"}}
    end

    context "happy path posting a link" do
      it "should save a resource in the database" do
        Topic.stub(:find).and_return(@mock_topic)
        #Resource.stub(:new).and_return(@mock_resource)
        # @mock_resource.should_receive(:save!)
        lambda do
          post :create, @resource_array
        end.should change(@mock_topic.resources, :count).from(0).to(1)
      end

      it "should redirect to the resources page" do
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@mock_resource)
        post :create, @resource_array
        #response.should redirect_to resources_path
      end
    end

    context "sad path blank title field" do
      it "should redirect to itself with its own params" do
        error_array = Hash.new(@resource_array)
        error_array.delete(:title)
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array)
      end
    end

    context "sad path blank link field" do
      it "should redirect to itself with its own params" do
        error_array = Hash.new(@resource_array)
        error_array.delete(:link)
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array)
      end
    end
  end
end

