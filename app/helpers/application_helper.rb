module ApplicationHelper

	# def has_courses?
	# 	unless Subscription.where(:user_id => current_user.id).nil?
	# 		return false
	# 	else
	# 		return true
	# 	end
	# end

	def subscribed?
		if Subscription.where(:user_id => current_user.id, :course_id => self.id)
			return true
		else
			return false
		end
	end
	
end