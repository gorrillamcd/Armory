FactoryGirl.define do
	factory :user do
		email { Forgery::Internet.email_address }
		password 'secret'
		
		factory :admin do
			role 'admin'
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
		name { Forgery::LoremIpsum.words(3) }
		description { Forgery::LoremIpsum.sentences(3)}

		factory :book do
			isbn { Forgery::Basic.number(:at_least => 1000, :at_most => 3000) }
			name { "The book of #{Forgery::Name.first_name}" }
		end
	end
end