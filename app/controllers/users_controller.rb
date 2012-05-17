class UsersController < ApplicationController

### Controller Explanation ###
#
# UsersController is for managing users. It's currently pretty self-explanatory, but there are a few things to note:
# 	The index action groups users by role
# 	new, create, edit, update, and destroy actions are controlled by Devise.
# 	It has not been integrated with CanCan yet
	before_filter :authenticate_user!

	# TODO: integrate with CanCan authorization

	#load_and_authorize_resource
	skip_authorization_check

	def index
    	@users = User.all.group_by(&:role)
	end

	def show
		@user = User.find(params[:id])
		@courses = @user.courses
	end

	def new
		#@user = User.new
	end

	def create
		#@user = User.new(params[:user])
		if @user.save
			redirect_to @user
			flash[:notice] = "Successfully created #{@user.name}."
		else
			render :action => 'new'
		end
	end

	def edit
		#@user = User.find(params[:id])
	end

	def update
		#@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user
			flash[:notice] = "Successfuly updated account for #{@user.name}."
		else
			render :action => 'edit'
		end
	end

	def destroy
		#@user = User.find(params[:id])
		username = @user.name
		@user.destroy
		redirect_to users_url
		flash[:error] = "Successfully destroyed #{username}"
	end
end