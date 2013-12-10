class DrUser < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :mail, :pass, :uid

  has_many :resources
  has_many :reviews

  def self.authenticate(name, password)
    user = DrUser.find_by_name(name)
    if user && user.pass == Digest::MD5.hexdigest(password)
      user
    else
      nil
    end
  end
end
