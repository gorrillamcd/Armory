class DashboardController < ApplicationController

before_filter :authenticate_user!
skip_authorization_check # TODO: Add authorization to this controller

	def show
		if user_signed_in?
			case current_user.role

				when "admin" 		# TODO: Expand admin dashboard to provide all needed info
					@recent_users = User.limit(5).order("created_at DESC").group_by(&:role) # TODO: Change occurences of group_by for it's ARel equivalent
				when "staff"
					return true 	# TODO: Add Staff Dashboard
				when "teacher"
					return true 	# TODO: Add Teacher Dashboard
				when "student" 	# TODO: Expand Student dashboard to provide all needed info
					#@subscriptions = Subscription.where(:user_id => current_user.id).group_by(&:state)
					@courses = current_user.courses.select('courses.*, subscriptions.state').group_by(&:state)
					@available = Course.limit(5).order("created_at DESC")
				else
					return false
					
			end
		else
			redirect_to :root
			flash[:error] = "You must be logged in first."
		end
	end

end