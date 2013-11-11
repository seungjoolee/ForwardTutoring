class Topic < ActiveRecord::Base
  attr_accessible :title

  belongs_to :field
end
