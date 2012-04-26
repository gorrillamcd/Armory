require 'spec_helper'

describe "Courses" do
	
	User::ROLES.each do |role|
		shared_examples role.to_s do
			it "logs in and then" do
				@role = FactoryGirl.create(role.to_sym)
				visit new_user_session_path
				fill_in "Email", :with => @role.email
				fill_in "Password", :with => @role.password
				click_button "Sign in"
				current_path.should eq(root_path)
				page.should have_content("Signed in successfully")
			end
		end
	end

	describe "as admin" do

		it_behaves_like "admin"
		
		it "creates a new course" do
		  	@course = create(:course)
		  	visit '/courses/new/'
		  	page.should have_content('New Course')
		  	fill_in "course_name", :with => @course.name
		  	fill_in "Description", :with => @course.description
		  	#fill_in "course_books_attributes_0_name", :with => @course.book.name
		  	#fill_in "course_books_attributes_0_isbn", :with => @course.book.isbn
		  	click_button "Create Course"
		  	current_path.should eq(course_path)
		  	page.should have_content("Successfully created Course.")
		  	#page.should have_content("")
		end
	end
end
