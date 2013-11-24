require 'spec_helper'
describe ResourcesController do

  describe "Create a resource" do
    before :all do
      @mock_subject = FactoryGirl.create(:subject)
      @mock_field = FactoryGirl.create(:field)
      @mock_field.subject_id = @mock_subject.id
      @mock_topic = FactoryGirl.create(:topic)
      @mock_topic.field_id = @mock_field.id
      @mock_resource = FactoryGirl.create(:resource)
      @mock_resource.topic_id = @mock_topic.id
      @resource_array = {resource: {:title => "Algebra", :link => "algebra.com", :topic_id => @mock_topic.id}}
    end

    before :each do
      @error_resource = double('resource', :errors => {}, :valid? => true, :save! => nil, :title => "Algebra", :link => "algebra.com", :topic_id => @mock_topic.id)
      @error_resource.stub(:errors => double('error', :full_messages => "error"), :valid? => false)
    end

    context "happy path posting a link" do
      it "should save a resource in the database" do
        Topic.stub(:find).and_return(@mock_topic)
         lambda do
          post :create, @resource_array
          end.should change(Resource, :count).by(1)
      end

      it "should save a resource in the topic" do
        Topic.stub(:find).and_return(@mock_topic)
        lambda do
          post :create, @resource_array
        end.should change(@mock_topic.resources, :count).by(1)
      end

      it "should redirect to the topic page" do
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@mock_resource)
        post :create, @resource_array
        response.should redirect_to topic_path(@mock_topic.id)
      end
  end

    context "sad path blank title field" do
      it "should not change the resource count" do
        error_array = @resource_array.deep_dup
        error_array[:resource].delete(:title)
        Topic.stub(:find).and_return(@mock_topic)
        lambda do
          post :create, error_array
        end.should change(Resource, :count).by(0)
      end

      it "should redirect to itself with its own params" do
        error_array = @resource_array.deep_dup
        error_array[:resource].delete(:title)
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array[:resource])
      end
    end

    context "sad path blank link field" do
      it "should redirect to itself with its own params" do
        error_array = @resource_array.deep_dup
        error_array[:resource].delete(:link)
        Topic.stub(:find).and_return(@mock_topic)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array[:resource])
      end
    end
    after :all do
      @mock_subject.destroy
      @mock_topic.destroy
      @mock_field.destroy
      @mock_resource.destroy
    end
  end
end

