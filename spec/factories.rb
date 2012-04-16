FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "foo#{n}@example.com"}
		password 'secret'
		
		factory :admin do
			role 'student'
		end

		factory :staff do
			role 'staff'
		end

		factory :teacher do
			role 'teacher'
		end

		factory :student do
			role 'student'
		end
	end

	factory :course do
		sequence(:name) { |n| "#{n}course"}
		description 'random description of course'

		factory :book do
			isbn { 1 + rand(10000) }
			sequence(:name) { |n| "The book of #{n}" }
		end
	end
end