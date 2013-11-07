class Resource < ActiveRecord::Base
  attr_accessible :title, :posted_by, :description, :link
end
