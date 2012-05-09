class SubscriptionsController < ApplicationController

	before_filter :authenticate_user!
	# TODO: restrict create action to students only but allow staff, admins, and students to drop(destroy) or change status(edit/update)
	skip_authorization_check

	def create
		@course = Course.find(params[:course_id])
		Subscription.create!( :user_id => current_user.id, :course_id => params[:course_id])
		redirect_to @course # TODO: change this redirect to payment module for paying for a class
		flash[:notice] = "You're now subscribed to #{@course.name}! WooHoo!"
	end

	def destroy
		redirect_to root_url # TODO: finish this action later
	end
end