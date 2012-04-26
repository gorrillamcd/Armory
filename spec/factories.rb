FactoryGirl.define do
	factory :user do
		email { Forgery::Internet.email_address }
		password 'secret'
		
		User::ROLES.each do |r|
			factory r.to_sym do
				role 'r'
			end
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