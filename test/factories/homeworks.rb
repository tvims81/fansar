# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homework do
  	student
  	lecture
  	score 0
  end
end
