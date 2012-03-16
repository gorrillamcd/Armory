class CoursesController < ApplicationController
	def index
    	@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(params[:course])
		if @course.save
			redirect_to @course, :notice => "Successfully created course."
		else
			render :action => 'new'
		end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.update(params[:course])
		if @course.update_attributes(params[:course])
			redirect_to @course, :notice  => "Successfully updated course."
		else
			render :action => 'edit'
		end
	end

	def detail
		@course = Course.find(params[:id])
		@lesson = @course.lessons#.find(params[:id])
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to courses_url, :notice => "Successfully destroyed course."
	end
end
