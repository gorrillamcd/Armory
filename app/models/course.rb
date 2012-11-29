class Course < ActiveRecord::Base
	
	# Accessible Attributes and Filters
  attr_accessible :name, :description, :books_attributes

	# Associations
	has_many :lessons, :dependent => :destroy
	has_many :exams, :through => :lessons

	has_many :subscriptions
	has_many :users, :through => :subscriptions, :uniq => true

	has_many :books, :dependent => :destroy

	accepts_nested_attributes_for :books, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

	# Validations
	validates_presence_of :name, :description


	# Scopes
	scope :with_status, 	->(state) { where('subscriptions.state = ?', state) }

	# Methods

	def find_state
		@subscription ||= Subscription.find_by_course_id(self.id)
		@subscription.state
	end

end
