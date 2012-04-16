Factory.define :student do |f|
	f.sequence(:email) { |n| "foo#{n}@example.com"}
	f.password "secret"
	f.role "student"
end