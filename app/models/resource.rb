class Resource < ActiveRecord::Base
  has_many :reviews
  attr_accessible :title, :posted_by, :description, :link, :topic_id, :pdf, :pdf_file_name
  belongs_to :topic

  has_attached_file :pdf , url: "/pdfs/:id", default_url: ""

  validates_presence_of :title, , :topic_id, {:message => "should not be blank"}
  validates_presence_of :link
  validates_presence_of :pdf

#, url: pdf_resource_path(this)

end
