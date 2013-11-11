class Topic < ActiveRecord::Base
  attr_accessible :title

  belongs_to :field
  has_many :resources
end
