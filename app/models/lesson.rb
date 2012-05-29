class Lesson < ActiveRecord::Base
  attr_accessible :name, :description, :teaching
  belongs_to :course
  
  has_many :questions
  has_many :grades

  has_attached_file :teaching

end
