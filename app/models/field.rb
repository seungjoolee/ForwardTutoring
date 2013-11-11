class Field < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of :title, {:message => "should not be blank"}

  belongs_to :subject
  has_many :topics
  has_many :resources, :through => :topics, :source => :resources
end
