require 'spec_helper'
describe ResourcesController do
  #describe

  describe "Create a resource" do
    before do
      @mock_resource = double('resource', :errors => nil, :valid? => true, :save! => nil, :title => "Algebra", :link => "algebra.com", :category => "math")
      @error_resource = double('resource', :errors => nil, :valid? => true, :save! => nil, :title => "Algebra", :link => "algebra.com", :category => "math")
      @error_resource.stub(:errors => double('error', :full_messages => "error"), :valid? => false)
      @resource_array = {:title => "Algebra", :link => "algebra.com", :category => "math"}
    end

    context "happy path posting a link" do
      it "should send a new method to the Resource model" do
        Resource.should_receive(:new).and_return(@mock_resource)
        post :create, @resource_array
      end

      it "should save a resource in the database" do
        Resource.stub(:new).and_return(@mock_resource)
        @mock_resource.should_receive(:save!)
        post :create, @resource_array
      end

      it "should redirect to the resources page" do
        Resource.stub(:new).and_return(@mock_resource)
        post :create, @resource_array
        response.should redirect_to resources_path
      end
    end

    context "sad path blank title field" do
      it "should redirect to itself with its own params" do
        error_array = Hash.new(@resource_array)
        error_array.delete(:title)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array)

      end
    end

    context "sad path blank link field" do
      it "should redirect to itself with its own params" do
        error_array = Hash.new(@resource_array)
        error_array.delete(:link)
        Resource.stub(:new).and_return(@error_resource)
        post :create, error_array
        response.should redirect_to new_resource_path(error_array)
      end
    end


  end
end
