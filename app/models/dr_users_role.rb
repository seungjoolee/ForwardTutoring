class DrUsersRole < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :uid, :rid  
  #uid - is the id number of the dr_user
  #rid - is the access privilege listed below
  # 1 anonymous user
  # 2 authenticated user
  # 3 admin
  # 4 TAMS
  # 5 Tutor
  # 6 Non-Profit
  # 7 SpecialTutor
  # 8 Blog Manager
  # 9 Site Architect

  #multiple rows of the same uid may exist, with a different rid
end