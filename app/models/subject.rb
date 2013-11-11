class Subject < ActiveRecord::Base
  attr_accessible :title

  has_many :fields
  has_many :topics, :through => :fields, :source => :topics
end
