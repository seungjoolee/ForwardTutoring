class Subject < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of :title, {:message => "should not be blank"}

  has_many :fields
  has_many :topics, :through => :fields, :source => :topics
  has_many :resources, :through => :topics, :source => :resources
end
