class Lesson < ActiveRecord::Base
  attr_accessible :name, :description, :teaching, :course_id
  belongs_to :course
  has_one :exam

end
