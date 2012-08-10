class DashboardController < ApplicationController

skip_authorization_check # TODO: Add authorization to this controller

	def show
		case current_user.role

			when "admin"
				@recent_users = User.limit(5).order("created_at DESC").group_by(&:role)
			when "staff"
				return true
			when "teacher"
				return true
			when "student"
				@subscriptions = Subscription.where(:user_id => current_user.id).group_by(&:state)
				@courses = current_user.courses.select('courses.*, subscriptions.state').group_by(&:state)
			else
				return false
				
		end
	end

end