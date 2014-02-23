# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

math  = Subject.create(:title => "Math")
  geometry = math.fields.create(:title => "Geometry")
    proofs = geometry.topics.create(:title => "Proofs")
      proof_worksheet = proofs.resources.create(:title => "Exciting Proofs Worksheet", :description => "Includes various proofs regarding non-Eurclidian space.", :link => "www.facebook.com")
      area_proof = proofs.resources.create(:title => "Proof: Area of a Circle", :description => "Detailed proof and description of A=piR^2.", :link => "www.facebook.com")
    parallel_and_perpendicular_lines = geometry.topics.create(:title => "Parallel and Perpendicular Lines")
      intersections = parallel_and_perpendicular_lines.resources.create(:title => "Wow! Intersecting Lines!", :description => "10 short answer questions. High difficulty.", :link => "www.facebook.com")
    triangles = geometry.topics.create(:title => "Triangles")
      triangle_types = triangles.resources.create(:title => "Triangle Types Worksheet", :description => "25 multiple choice questions. Circle the correct triangle type.", :link => "www.facebook.com")
    quadrilaterals = geometry.topics.create(:title => "Quadrilaterals")
    proportions_and_similarity = geometry.topics.create(:title => "Proportions and Similarity")
    right_triangles_and_trigonometry = geometry.topics.create(:title => "Right Triangles and Trigonometry")
    transformations = geometry.topics.create(:title => "Transformations")
    circles = geometry.topics.create(:title => "Circles")
    areas_of_polygons_and_circles = geometry.topics.create(:title => "Areas of Polygons and Circles")
    surface_area_and_volume = geometry.topics.create(:title => "Surface Area and Volume")
  algebra_i = math.fields.create(:title => "Algebra I")
  algebra_ii = math.fields.create(:title => "Algebra II")
  calculus_i = math.fields.create(:title => "Calculus I")
  calculus_ii = math.fields.create(:title => "Calculus II")

science = Subject.create(:title => "Science")
  biology = science.fields.create(:title => "Biology")
  chemistry = science.fields.create(:title => "Chemistry")
  physics = science.fields.create(:title => "Physics")

admin = AdminUser.create(:email => "admin@example.com", :password => "password", :password_confirmation => "password")
tutor = DrUser.create(:mail => "Tutor", :pass => "a6957055e16a029de615583f3029e7ae", :uid => "1", :name => "Tutor")
role = DrUsersRole.create(id: "1", uid: "1", rid: 5)

#history = Subject.create(:title => "History")
#english = Subject.create(:title => "English")
#foreign_languages = Subject.create(:title => "Foreign Languages")
#art_and_music = Subject.create(:title => "Art and Music")
