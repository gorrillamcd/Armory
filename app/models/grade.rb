class Grade < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :exam

  ## Grading Methods ##

end
