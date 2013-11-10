class Review < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :anonymous, :content, :rating, :user
end
