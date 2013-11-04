class Resource < ActiveRecord::Base
  attr_accessible :author, :summary, :title, :description, :link, :file
end
