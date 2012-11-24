class CoursesController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show]
	load_and_authorize_resource
	
	def index
    	#@courses = Course.all
	end

	def show
		#@course = Course.find(params[:id])
		@lesson = @course.lessons
		@books = @course.books
		@subscription = @course.subscriptions.where(:user_id => current_user.id).first
	end

	def new
		#@course = Course.new
		@course.books.build
	end

	def create
		#@course = Course.new(params[:course])
		if @course.save
			redirect_to @course
			flash[:notice] = "Successfully created course."
		else
			render :action => 'new'
		end
	end

	def edit
		#@course = Course.find(params[:id])
	end

	def update
		#@course = Course.find(params[:id])
		if @course.update_attributes(params[:course])
			redirect_to @course
			flash[:notice] = "Successfuly updated course."
		else
			render :action => 'edit'
		end
	end

	def destroy
		#@course = Course.find(params[:id])
		coursename = @course.name
		@course.destroy
		redirect_to courses_url
		flash[:error] = "Successfully destroyed #{coursename}"
	end
end
