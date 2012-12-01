class GradesController < ApplicationController
  
  skip_authorization_check

  def show
    if params[:exam_id]
      @grade = current_user.grades.where(:exam_id => params[:exam_id])
    else
      @grades = current_user.grades.includes(:exam).group_by(&:exam_id)
    end
  end

  def new
    @exam = Exam.find_by_id(params[:exam_id])
    @lesson = @exam.lesson
    @questions = @exam.questions.includes(:answers)
    @subscription = Subscription.find_by_id(params[:subscription_id])
    @grade = @exam.build_grade
  end

  def create
    @exam = Exam.find_by_id(params[:exam_id]).includes(:questions => :answers)
    @subscription = Subscription.find_by_id(params[:subscription_id])
    @grade = @subscription.grades.new
    @correct_answers = 
    
    @grade.average_grade = calculate_grade(params[:questions])
    @grade.exam_id = @exam.id

    if @grade.save
      redirect_to subscription_grade_path(@subscription, @grade), :notice => "You completed the exam!"
    else
      render :new
    end

  end

end
