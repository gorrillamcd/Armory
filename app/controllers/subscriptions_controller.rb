class SubscriptionsController < ApplicationController

### Controller Explanation ###
#
# The SubscriptionsController manages subscriptions/relationships between a student and a course.
# Each subscription should be unique with respect to the :user_id and :course_id.
# This controller doesn't interact with views directly, but is called when creating a subscription.
# Destroy is not used and will most likely either be modified to be a tombstone action or removed altogether.
#

	before_filter :authenticate_user!
	# TODO: restrict create action to students only but allow staff, admins, and students to drop(destroy) or change status(edit/update)
	skip_authorization_check

	def create
		@course = Course.find(params[:course_id])
		Subscription.create!(:user_id => current_user.id, :course_id => params[:course_id])
		redirect_to @course
		flash[:notice] = t('ui.subscriptions.create.success', :name => @course.name)
	end

	def destroy
		redirect_to root_url # TODO: Finish the destroy action to unsubscribe from course.
	end
end