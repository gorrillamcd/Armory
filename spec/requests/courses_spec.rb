require 'spec_helper'

describe "Courses" do
	describe "as admin" do
		before :each do
			@user = create(:admin)
			visit new_user_session_path
			fill_in "Email", :with => @user.email
			fill_in "Password", :with => @user.password
			click_button "Sign in"
			current_path.should eq(root_path)
			page.should have_content("Signed in successfully")
		end

		it "creates a new course" do
		  	@course = create(:book)
		  	visit '/courses/new/'
		  	page.should have_content('New Course')
		  	fill_in "course_name", :with => @course.name
		  	fill_in "Description", :with => @course.description
		  	fill_in "course_books_attributes_0_name", :with => @course.book.name
		  	fill_in "course_books_attributes_0_isbn", :with => @course.book.isbn
		  	click_button "Create Course"
		  	current_path.should eq(course_path)
		  	page should have_content("Successfully created Course.")
		end
	end
end
