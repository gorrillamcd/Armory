# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    references ""
    amount 1
    kind "MyString"
  end
end
