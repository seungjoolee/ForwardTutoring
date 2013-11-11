# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

math  = Subject.create(:title => "Math")
geometry = math.fields.create(:title => "Geometry")
triangles = geometry.topics.create(:title => "Triangles")
squares = geometry.topics.create(:title => "Circumference")
algebra = math.fields.create(:title => "Algebra")



#subjects = Subject.create([ {title: "Math"}, {title: "Science"}, {title: "History"} ])
#math_fields = Field.create([ {:title => "Calculus"}, {:title => "Algebra"}, {:title => "Geometry"} ])
#math.fields = math_fields
#subjects.first.fields = math_fields