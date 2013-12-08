class Review < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :anonymous, :content, :rating, :user, :resource_id
  validates_presence_of :user, :content,  {:message => "should not be blank"}
  validates :content, length: { maximum: 150, too_long: "%{count} chars is the maximum allowed"}
end
