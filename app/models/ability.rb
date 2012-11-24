class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # Represents a guest user

		#role = user.role

		case user.role
			when "admin"
				can :manage, :all
			when "staff"
				can :read, :all
				can :manage, Course, :except => :destroy
				can :manage, Lesson, :except => :destroy
			when "teacher"
				can [:read, :update, :create], Course
				can [:read, :update, :create], Lesson
			when "student"
				can :read, Course
				can :read, Lesson
			# when "contributor" TODO: Add contributor role for those that work on content only
			else
				can :read, Course
				can :read, Pages
		end

	end
end