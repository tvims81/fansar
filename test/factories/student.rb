FactoryGirl.define do
  factory :student do
    name "Student"
    email { Faker::Internet.email('lorem') }
    password '111111'

  end
end