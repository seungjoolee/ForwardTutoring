class Field < ActiveRecord::Base
  attr_accessible :title

  belongs_to :subject
  has_many :topics
  has_many :resources, :through => :topics, :source => :resources
end
