require 'spec_helper'

describe Review do
  describe "new" do
    before do
      @review_hash = {user: "Algebra", rating: "Kent", content: "hi", resource_id: "1"}
    end

    it "should pass normally" do
      new_review = Hash[@review_hash]
      review = Review.new(new_review)
      review.should be_valid
  end

    it "should error with a nil user" do
      nil_user = Hash[@review_hash]
      nil_user.delete(:user)
      review = Review.new(nil_user)
      review.should_not be_valid
    end

    it "should error with nil content" do
      nil_content = Hash[@review_hash]
      nil_content.delete(:content)
      review = Review.new(nil_content)
      review.should_not be_valid
    end

    it "should error with empty  content" do
      empty_content = Hash[@review_hash]
      empty_content[:content] = ""
      review = Review.new(empty_content)
      review.should_not be_valid
    end

   # it "should pass with nil anonymous"
  end

  describe "Associations" do
    it "should belong to a resource" do
      review = Review.reflect_on_association(:resource)
      review.macro.should == :belongs_to
    end
  end
end
