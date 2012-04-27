class UsersController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
    	#@users = user.all
    	User::ROLES.each do |r|
    		@r.pluralize = @user.where(:role => r.to_s)
    	end
	end

	def show
		#@user = user.find(params[:id])
	end

	def new
		#@user = user.new
	end

	def create
		#@user = user.new(params[:user])
		if @user.save
			redirect_to @user
			flash[:notice] = "Successfully created #{@user.name}."
		else
			render :action => 'new'
		end
	end

	def edit
		#@user = user.find(params[:id])
	end

	def update
		#@user = user.find(params[:id])
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