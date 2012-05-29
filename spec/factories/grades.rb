# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grade do
    average_grade 1
    subscription nil
    lesson nil
  end
end
