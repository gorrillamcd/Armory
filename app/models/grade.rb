class Grade < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :exam

  attr_accessor :answer
  
  ## Grading Methods ##

end
