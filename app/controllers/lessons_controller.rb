class LessonsController < ApplicationController

	def new
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.new
	end

	def create
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.create(params[:lesson])
		if @lesson.save
			redirect_to course_path(@course), :notice => "Successfully created lesson."
		else
			render :action => 'new', :error => "Something went wrong."
		end
	end

	def edit
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.find(params[:id])
	end

	def update
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.find(params[:id])
		if @lesson.update_attributes(params[:lesson])
			redirect_to course_path(@course), :notice  => "Successfully updated course."
		else
			render :action => 'edit'
		end
	end

	def show
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.find(params[:id])
	end

	def destroy
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.find(params[:id])
		@lesson.destroy
		redirect_to course_path(@course), :notice => "Successfully destroyed lesson."
	end

end