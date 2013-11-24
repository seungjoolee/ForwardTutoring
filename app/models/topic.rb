class Topic < ActiveRecord::Base
  attr_accessible :title, :field_id
  validates_presence_of :title, {:message => "should not be blank"}

  belongs_to :field
  has_many :resources
end
