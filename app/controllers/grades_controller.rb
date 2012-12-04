class GradesController < ApplicationController
  
  skip_authorization_check

  def show
    # if params[:exam_id]
    #   @grade = current_user.grades.where(:exam_id => params[:exam_id])
    # else
    #   @grades = current_user.grades.includes(:exam).group_by(&:exam_id)
    # end
    @subscription = Subscription.find_by_id(params[:subscription_id])
    @grade = @subscription.grades.where(:exam_id => params[:exam_id])
  end

  def new
    @exam = Exam.find_by_id(params[:exam_id])
    @lesson = @exam.lesson
    @questions = @exam.questions.includes(:answers)
    @subscription = Subscription.find_by_id(params[:subscription_id])
    @grade = @subscription.grades.new
  end

  def create
    @exam = Exam.find_by_id(params[:exam_id])
    @subscription = Subscription.find_by_id(params[:subscription_id])
    @questions = @exam.questions.includes(:answers)
    @grade = @subscription.grades.new
    @correct_answers = @exam.answers.select('answers.id, answers.correct').where(:correct => true).pluck('answers.id').to_a

    @response_answers = params[:questions]
    
    @grade.average_grade = @grade.calculate_grade(@correct_answers, @response_answers)
    @grade.exam_id = @exam.id

    if @grade.save
      redirect_to subscription_exam_grade_path(@subscription, @exam, @grade), :notice => t("ui.grades.take_exam.success")
    else
      render :new
    end

  end

end
