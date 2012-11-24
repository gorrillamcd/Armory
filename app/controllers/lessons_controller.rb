class LessonsController < ApplicationController
	load_and_authorize_resource
	

	def show
		@course = Course.find(params[:course_id])
		@lesson = Lesson.find(params[:id])
		@subscription = current_user.subscriptions.where(:course_id => @course).first
		@exam = Exam.where(:lesson_id => params[:id]).first
	end

	def new
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.new
	end

	def create
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.create(params[:lesson])
		if @lesson.save
			redirect_to new_lesson_exam_path(@lesson)
			flash[:notice] = "Successfully created lesson. Now you can make the quiz to go with it!"
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
			redirect_to course_lesson_path(@course, @lesson)
			flash[:notice]  = "Successfully updated course."
		else
			render :action => 'edit', :error => "Something went wrong."
		end
	end

	def destroy
		@course = Course.find(params[:course_id])
		@lesson = @course.lessons.find(params[:id])
		@lesson.destroy
		redirect_to course_path(@course)
		flash[:error] = "Successfully destroyed lesson."
	end

end