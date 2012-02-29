class Lesson < ActiveRecord::Base
  attr_accessible :name, :description, :teaching, :class_id
  belongs_to :class
  has_one :exam

end
