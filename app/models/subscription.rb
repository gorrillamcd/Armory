class Subscription < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	validates_presence_of :course_id, :user_id, :state

	state_machine :initial => :pending do
		
		##### Explanations of states #####
		#
		# :pending =>		For when a student is subscribed but hasn't yet paid
		# :active =>		The normal state for a course that is in progress.
		# :uncompleted =>	For when a student drops the course before it's completed
		# :completed =>		For when the student completes with a passing grade
		# :failed =>		For when the student completes with a failing grade
		# :inactive =>		Currently unused

		# For info on the helpers to access/update these states, check out the docs for state_machine at	http://rdoc.info/github/pluginaweek/state_machine/master/frames

		event :subscribe do
			transition any => :pending
		end

		event :pay do
			transition :pending => :active
		end

		event :drop do
			transition :active => :uncompleted
		end

		event :finish do
			transition :active => :completed
		end

		event :deactivate do
			transition :active => :inactive
		end

		event :activate  do
			transition :inactive => :active
		end

		event :flunk do # There's not any good synonyms for :fail :(
			transition :active => :failed
		end 
	end

	# def subscribe!(course)
	# 	Subscriptions.create!(:user_id => current_user.id, :course_id => course.id)
	# end

	# def subscribed?(course)
	# 	Subscriptions.where(:user_id => current_user.id, :course_id => course.id).nil?
	# end

	# def drop!(course)
	# 	true
	# end

end
