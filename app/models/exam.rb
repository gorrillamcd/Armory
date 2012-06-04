class Exam < ActiveRecord::Base
	# Exam is the model that contains the exams themselves. It's accompanying controller is for administrating exams. If you want the functionality for a student "taking" exams, check out Grade and grades_controller.
	
  attr_accessible :type, :questions_attributes

  belongs_to :lesson
  has_one :grade
  has_many :questions

  accepts_nested_attributes_for :questions, :allow_destroy => true

end
