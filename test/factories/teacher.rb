FactoryGirl.define do
  factory :teacher do
    name "Alexander"
    email { Faker::Internet.email('lorem') }
    password '111111'

  end
end