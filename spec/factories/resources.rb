require 'factory_girl'

FactoryGirl.define do
  factory :resource do
    title "How to Math"
    posted_by "Ryan"
    description "A guide on how to math"
    topic_id "1"
  end
end
