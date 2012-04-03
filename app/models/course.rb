class Course < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :lessons, :dependent => :destroy
  has_many :books
end
