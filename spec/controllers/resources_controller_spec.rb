require 'spec_helper'
describe ResourcesController do
  describe "Create a resource" do
    it "should return an error with a blank title" do
     # Resource.stub(:create).and_return(nil)
     # post :new, {:resource_author => "Kent"}
      end
    it "should pick only 1 of the link or the file"

    context "happy path posting a link" do
      it "should make a new resource in the database" do
        mock_resource = mock('resource', :id => 5, :title => "Algebra", :link => "algebra.com")
        Resource.should_receive(:create!).and_return(mock_resource)
        post :create #, {:title => mock_resource.title}
      end

       context "error with a blank link" do
        end
    end
    context "happy path upload a file" do

      end
    context "sad path upload an invalid file" do
      it "should error with an invalid file"
      it "should error with a blank file"
      end
  end
end
