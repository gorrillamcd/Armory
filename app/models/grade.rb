class Grade < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :exam

  attr_accessor :answer

  ## Grading Methods ##
  #  For the following methods, qid = "question id" and aid = "answer id", hsh = "hash"

  def calculate_grade(correct_answers, responses)
    responses = Grade.isolate_responses(responses)
    total = correct_answers.length.to_f
    puts total
    correct = Grade.correct!(correct_answers, responses)
    puts correct
    average = (correct / total) * 100
  end

  def self.correct!(correct_answers, responses) # Returns number of correct answers
    responses.each do |response|
      response.each_pair do |qid, aid|
        unless correct_answers.include?(aid)
          responses.delete(qid)
        end
      end
    end
    responses.length.to_f
  end

  def self.isolate_responses(input) # Clean up hash to make it easier to manipulate
    responses = Array.new
    input.each do |qid, answer|
      answer.each_value do |aid|
        responses << {qid=>aid}
      end
    end
    responses
  end

end
