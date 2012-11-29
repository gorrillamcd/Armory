class ExamsController < ApplicationController

	skip_authorization_check # TODO: integrate proper security after feature is done

	def show
		@lesson = Lesson.find(params[:lesson_id])
		# @subscription = @lesson.course.subscriptions.where(:user_id => current_user.id).first
		@exam = Exam.find(params[:id])
	end

	# def take_exam # Special action for a student taking the exam specified
	# end

	def new
		@lesson = Lesson.find(params[:lesson_id])
		@exam = @lesson.build_exam
	end

	def create
		@lesson = Lesson.find(params[:lesson_id])
		@exam = @lesson.build_exam(params[:exam])

	    if @exam.save
	      redirect_to lesson_exam_path(@lesson, @exam), notice: "Successfully created exam."
	    else
	      render :new
	    end
	end

	def edit
		@lesson = Lesson.find(params[:lesson_id])
		@exam = Exam.find(params[:id])
	end

	def update
		@lesson = Lesson.find(params[:lesson_id])
		@exam = Exam.find(params[:id])
		if @exam.update_attributes(params[:exam])
			redirect_to lesson_exam_path(@lesson, @exam), notice: "Successfully created exam."
		else
			render :action => 'edit', :error => "Something went wrong."
		end
	end
	
end
