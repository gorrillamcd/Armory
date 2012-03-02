class LessonsController < ApplicationController


	def index
		@lesson = Lesson.all
	end


	def new
		@lesson = Lesson.new
	end

	def create
		#@course = Course.find(params[:id])
		@lesson = Lesson.create(params[:lesson])
		if @lesson.save
			redirect_to url_for(@course), :notice => "Successfully created lesson."
		else
			render :action => 'new', :error => "Something went wrong."
		end
	end

	def show
		@lesson = @course.lessons.find(params[:lesson])
	end

	private

	def course
		@course = Course.find(params[:course_id])
	end

end