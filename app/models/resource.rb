class Resource < ActiveRecord::Base
  has_many :reviews
  attr_accessible :title, :posted_by, :description, :link, :topic_id, :pdf, :pdf_file_name
  belongs_to :topic

  has_attached_file :pdf , url: "/pdfs/:id", default_url: ""
  validates_attachment_size :pdf, :less_than => 10.megabytes
  validates_attachment_content_type :pdf, :content_type => ["text/plain",
                                                            "application/vnd.ms-excel",
                                                            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                            "application/msword",
                                                            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                            "application/pdf"], :message => 'Only PDF, WORD, or TEXT files are allowed. '

  validates_presence_of :title, :topic_id, {:message => "should not be blank"}
#  validates_presence_of :link, {:message => "should not be blank"}
#  validates_presence_of :pdf

#, url: pdf_resource_path(this)

end
