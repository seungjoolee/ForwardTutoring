class Review < ActiveRecord::Base
  attr_accessible :anonymous, :content, :rating, :resource_id, :dr_user_id
  validates_presence_of  :content,  {:message => "should not be blank"}
  validates :content, length: { maximum: 150, too_long: "%{count} chars is the maximum allowed"}

  belongs_to :resource
  belongs_to :dr_user

end
