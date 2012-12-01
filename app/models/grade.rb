class Grade < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :exam

  attr_accessor :answer

  ## Grading Methods ##

  def calculate_grade(correct_answer_ids, questions)
    # TODO: finish calculate_grade method on Grade model
    total = self.count
    correct = self.correct!
    average = correct / total
  end

  def correct!
    correct_answers = {}
    self.each do |answer|
      if answer.correct
        correct_answers << answer
      end
    end
    correct_answers
  end

end
