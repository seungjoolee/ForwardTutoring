class Resource < ActiveRecord::Base
  attr_accessible :title, :dr_user_id, :description, :link, :topic_id, :pdf, :pdf_file_name, :pdf_content_type, :pdf_file_size

  before_validation :process_link

  #has_attached_file :pdf , url: "/pdfs/:id", default_url: ""
  has_attached_file :pdf,
  url: "/pdfs/:hash.:extension",
  path: "#{Rails.root}/public/pdfs/:hash.:extension",
  default_url: "",
  :hash_secret => "tEsZNIU7mRszWVwfROKmnVH72cZPxcbYDzxvKzQMalTk83XFiJp0ncwoKJiQInfNWPnVbIhhoOKqezLGpKTi1NkoW6vYCKaqD4peZuLsxxrqnaatyCWQnEYqQ9J5UZpg2m6iLG1QD6TI8zDVfmnVR3ZcqLdwsDOxafxlrRlxnQVl82yRjgzhXAYHYezmiJNwosGt7ij2g"

  validates_attachment_size :pdf, :less_than => 10.megabytes
  validates_attachment_content_type :pdf, :content_type => ["text/plain",
                                                            "application/vnd.ms-excel",
                                                            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                            "application/msword",
                                                            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                            "application/pdf"], :message => "Only PDF, WORD, EXCEL, or TEXT files are allowed"

  validates_presence_of :title, :topic_id, {:message => "should not be blank"}
  validates :title, length: { maximum: 64, too_long: "%{count} chars is the maxium allowed"}
  validates :description, length: { maximum: 150, too_long: "%{count} chars is the maximum allowed"}
  validates :link, length: { maximum: 200, too_long: "%{count} chars is the maximum allowed"}
  validate :link_xor_pdf
  #validates :link, :allow_blank => true, :uniqueness => { :case_sensitive => false }
  validates_format_of :link, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :allow_blank => true
#  validates_presence_of :link, {:message => "should not be blank"}
#  validates_presence_of :pdf

#, url: pdf_resource_path(this)

  has_many :reviews
  belongs_to :topic
  belongs_to :dr_user

  private

    def link_xor_pdf
      if !(self.link.blank? ^ self.pdf.blank?)
        errors.add(:base, "Specify either a pdf or link")
      end
    end

    def process_link
      if !self.link.blank? and !self.link.start_with?('http://', 'https://')
     #if !self.link.blank? & !self.link.start_with?('http://', 'https://')
        self.link.insert(0, 'http://')
      end
    end

end
