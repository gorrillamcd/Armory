class GradesController < ApplicationController

  def show
    if params[:exam_id]
      @grade = current_user.grades.where(:exam_id => '?', params[:exam_id])
    else
      @grades = current_used.grades.includes(:exam).group_by(&:exam_id)
    end
  end

  def new
    @exam = Exam.find_by_id(params[:exam_id])
    @grade = @exam.grade.new
  end

end
