class Field < ActiveRecord::Base
  attr_accessible :title

  belongs_to :subject
  has_many :topics
end
