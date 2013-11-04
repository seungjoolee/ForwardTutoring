require 'spec_helper'
describe ResourcesController do
  describe "Adding a resource" do
    it "should error with a blank title"
    it "should pick only 1 of the link or the file"

    context "posting a link" do
    it "should error with a blank link"
    end
    context "happy path upload a file" do

      end
    context "sad path upload an invalid file" do
      it "should error with an invalid file"
      it "should error with a blank file"
      end
  end
end
