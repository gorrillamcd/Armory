class Course < ActiveRecord::Base
	
	# Accessible Attributes and Filters
  	attr_accessible :name, :description, :books_attributes

	# Associations
	has_many :lessons, :dependent => :destroy
	has_many :books, :dependent => :destroy
	has_many :users, :through => :subscriptions, :uniq => true

	accepts_nested_attributes_for :books, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

	# Validations
	validates_presence_of :name, :description

end
