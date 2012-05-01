class Subscription < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	state_machine :state, :initial => :pending do
		event :subscribe do
			transition any => :pending
		end

		event :pay do
			transition :pending => :active
		end

		event :drop do
			transition :active => :incomplete
		end

		event :finish do
			transition :active => :complete
		end

		event :archive do
			transition any => :inactive
		end

		event :unarchive  do
			transition :inactive => :active
		end
	end
	
end
