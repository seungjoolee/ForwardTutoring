class Resource < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :title, :link, :category, {:message => "should not be blank"}
end
