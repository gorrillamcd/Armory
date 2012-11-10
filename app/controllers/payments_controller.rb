class PaymentsController < ApplicationController
  
  before_filter :authenticate_user!
  skip_authorization_check

  include MoneyModule

  def index
    if current_user.role == "admin"
      @payments = User.joins(:subscriptions => :payment).group('payments.completed_at')
      # @course = @payments.courses
      # @payments = @user.joins('payments').group('payments.completed_at').all
    elsif current_user.role == "student"
      # @subs = Subscription.joins(:course).joins(:payment).select('subscriptions.*, courses.name').where(:user_id => current_user.id)
      # @payments = Payment.where(:id => @subs).group('payments.completed_at')
      @payments = Payment.includes(:subscriptions => :course).where('subscriptions.user_id' => current_user.id)
    else
      redirect_to dashboard_url
      flash[:error] = t('ui.payments.index.unauthorized') # TODO: Add translation in locales for ui.payments.index.unauthorized
    end
  end

  def new
    @unpaid_subs = current_user.subscriptions.unpaid.includes(:course)
    @payment = Payment.new
  end

  def create
    @unpaid_subs = current_user.subscriptions.unpaid.includes(:course)
    @payment = current_user.payments.new(params[:payment])

    # @payment.user_id = current_user.id
    @payment.kind = @payment.determine_kind
    @payment.amount = @unpaid_subs.calculate_cost
    if @payment.charge_and_save
      redirect_to dashboard_url, :notice => "Thank you for Paying!"
    else
      render :action => 'new'
    end
  end

  def update

  end
end