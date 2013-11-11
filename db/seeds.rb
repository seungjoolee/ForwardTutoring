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
    lines = geometry.topics.create(:title => "Parallel and Perpendicular Lines")
    triangles = geometry.topics.create(:title => "Triangles")
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
  
#history = Subject.create(:title => "History")
#english = Subject.create(:title => "English")
#foreign_languages = Subject.create(:title => "Foreign Languages")
#art_and_music = Subject.create(:title => "Art and Music")