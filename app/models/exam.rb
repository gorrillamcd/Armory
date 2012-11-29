class Exam < ActiveRecord::Base
	# Exam is the model that contains the exams themselves. It's accompanying controller is for administrating exams. If you want the functionality for a student "taking" exams, check out Grade and grades_controller.
	
  attr_accessible :kind, :weight, :questions_attributes, :grades_attributes

  belongs_to :lesson
  belongs_to :course
  has_one :grade
  has_many :questions

  # accepts_nested_attributes_for :grade
  accepts_nested_attributes_for :questions, :allow_destroy => true

end
