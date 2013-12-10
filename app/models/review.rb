class Review < ActiveRecord::Base
  attr_accessible :anonymous, :content, :rating, :user, :resource_id
  validates_presence_of :user, :content,  {:message => "should not be blank"}
  validates :content, length: { maximum: 150, too_long: "%{count} chars is the maximum allowed"}

  belongs_to :resource
  belongs_to :dr_user

end
