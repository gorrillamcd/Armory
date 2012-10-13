class PaymentsController < ApplicationController
  
  before_filter :authenticate_user!
  skip_authorization_check

  def index
    if current_user.role == "admin"
      @payments = User.joins(:subscriptions => :payment).group('payments.completed_at')
      # @course = @payments.courses
      # @payments = @user.joins('payments').group('payments.completed_at').all
    elsif current_user.role == "student"
      @user = current_user.joins(:subscriptions)
      @payments = @user.payments.group('payments.completed_at')
    else
      redirect_to dashboard_url
      flash[:error] = t('ui.payments.index.unauthorized') # TODO: Add translation in locales for ui.payments.index.unauthorized
    end
  end

  def new
    @unpaid_courses = current_user.courses.unpaid
    @payment = Payment.new
  end

  def create

  end

  def update

  end

end
