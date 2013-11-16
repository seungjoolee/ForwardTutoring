class Review < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :anonymous, :content, :rating, :user, :resource_id
  validates_presence_of :content,  {:message => "should not be blank"}
end
