class Answer < ActiveRecord::Base
  
  attr_accessible :text, :question_id, :correct # TODO: Take :correct off attr_accessible and assign properly

  belongs_to :question
  belongs_to :exam
  
end
