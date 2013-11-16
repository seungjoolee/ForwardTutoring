class Resource < ActiveRecord::Base
  has_many :reviews
  attr_accessible :title, :posted_by, :description, :link, :topic_id
  belongs_to :topic
  validates_presence_of :title, :link, :topic_id, {:message => "should not be blank"}


end
