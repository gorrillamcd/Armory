class Lesson < ActiveRecord::Base
  attr_accessible :name, :description, :teaching
  belongs_to :course
  
  has_one :exam

  has_attached_file :teaching

end
