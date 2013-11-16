class Review < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :anonymous, :content, :rating, :user
  validates_presence_of :content,  {:message => "should not be blank"}
end
