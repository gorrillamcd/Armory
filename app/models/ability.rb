class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # Represents a guest user

		if user.admin?
			can :manage, :all
		elseif user.staff?
			can :read, :all
			can :manage, Course, :except => :destroy
			can :manage, Lesson, :except => :destroy
		end
	end
end