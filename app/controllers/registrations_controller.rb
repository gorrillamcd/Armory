class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create
		# Make something like this for assigning user.role
		# P.S. I know now this is wrong and I should use if statements instead. But I'll leave this here to remind me it needs to be done.
		#
		# case params[role]
		# when params[role] == "admin" && @user.can?.update_attribute
		# 	@user.role = params[role]
		# when params[role] == "staff" && @user.can?.update_attribute
		# 	@user.role = params[role]
		# when params[role] == "teacher" && @user.can?.update_attribute
		# 	@user.role = params[role]
		# when params[role] == "student" && @user.can?.update_attribute
		# 	@user.role = params[role]
		# else
		# 	flash[:error] => "You don't have permission to update your user role."
		# 	render user_sign_up
		# end
		super
	end

	def update
		super
	end

end