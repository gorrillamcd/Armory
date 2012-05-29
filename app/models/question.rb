class Question < ActiveRecord::Base
  belongs_to :lesson
  has_many :answers

  accepts_nested_attributes_for :answers, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
