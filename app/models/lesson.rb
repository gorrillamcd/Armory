class Lesson < ActiveRecord::Base
  attr_accessible :name, :description, :teaching#, :course_id
  belongs_to :course
  has_many :questions
  has_attached_file :teaching

end
