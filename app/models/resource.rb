class Resource < ActiveRecord::Base
	has_many :reviews
	
  attr_accessible :title, :posted_by, :description, :link, :category

  validates_presence_of :title, :link, :category, {:message => "should not be blank"}
end
