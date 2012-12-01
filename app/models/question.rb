class Question < ActiveRecord::Base
  attr_accessible :text, :exam_id, :answers_attributes

  belongs_to :exam
  has_many :answers

  accepts_nested_attributes_for :answers, :allow_destroy => :true

end
