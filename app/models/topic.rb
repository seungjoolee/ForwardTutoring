class Topic < ActiveRecord::Base
  attr_accessible :title, :field_id, :description
  validates_presence_of :title, {:message => "should not be blank"}

  belongs_to :field
  has_many :resources

  def searchable_string()
  	searchable_string = self.title + " "
  	self.resources.each do |resource|
  		searchable_string = searchable_string + resource.title + " "
  	end
  	return searchable_string.downcase
  end
end
