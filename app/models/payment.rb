class Payment < ActiveRecord::Base
  has_many :subscriptions
  has_one :user, :through => :subscriptions

  attr_accessor :stripe_card_token

  attr_accessible :kind, :stripe_card_token #, :card_type, :card_expires_on, :card_number, :card_verification

  validates_presence_of :amount, :kind #, :card_type, :card_expires_on, :card_number, :card_verification

  # TODO: Make Payment functionality more user friendly, allowing users to pick which courses they will pay for
  # TODO: Make Payment method (Stripe or ActiveMerchant) a configurable option (default: Stripe)

  #after_create :update_subscription

  ### Some Utitlity methods

  def payment_amount(unpaid)
    cost_per_course = 3000 # Cost in cents per course
    @amount = unpaid.count * cost_per_course
    @amount
  end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(email: current_user.email, description: "Payment made by #{current_user.full_name}(id number #{current_user.id})", card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end

private

  def update_subscription
    @unpaid_subs = Subscription.where(:user_id => params[:user][:id]).unpaid
    @unpaid_subs.payment_id = @payment.id
    @unpaid_subs.activate
    @unpaid_subs.save
  end

end
