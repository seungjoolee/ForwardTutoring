class Resource < ActiveRecord::Base
  attr_accessible :description, :downloads, :title
end
