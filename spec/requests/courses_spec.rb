require 'spec_helper'

describe "Courses" do
  it "creates a new course" do
  	course = create(:course)
  	visit new_course_path
  	fill_in "course_name", :with => "Book of Judges"
  	fill_in "course_description", :with => "random description of the course"
  	click_button "submit"
  	page.should redirect_to(course_path)
  	page should have_content("Successfully created course.")
  end
end
