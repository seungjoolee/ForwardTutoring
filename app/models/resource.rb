class Resource < ActiveRecord::Base
  attr_accessible :title, :posted_by, :description, :link, :category

  belongs_to :topic

  validates_presence_of :title, :link, :category, {:message => "should not be blank"}
end