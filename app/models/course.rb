class Course < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :lessons, :dependent => :destroy
end
