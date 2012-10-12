class PaymentsController < ApplicationController
  
  before_filter :authenticate_user!
  skip_authorization_check

  def index
    if current_user.role == "admin"
      @payments = User.joins(:subscriptions => :payment).group('payments.completed_at')
      @course = User.courses.paid
      # @payments = @user.joins('payments').group('payments.completed_at').all
    elsif current_user.role == "student"
      @user = current_user.joins(:subscriptions)
      @payments = @user.payments.group('payments.completed_at')
    else
      redirect_to dashboard_url
      flash[:error] = t('ui.payments.index.unauthorized')
    end
  end

  def new
    @pending_courses = current_user.courses.unpaid
    @payment = Payment.new
  end
# You left off last night making the payment new and create actions. You were thinking that maybe
# the :paid and :unpaid scopes should go on the Payment model, but you were tired and couldn't think.
  def create

  end

  def update

  end

end
