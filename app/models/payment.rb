class Payment < ActiveRecord::Base
  has_many :subscriptions
  has_one :user, :through => :subscriptions

  attr_accessor :stripe_card_token, :user_id

  attr_accessible :kind, :stripe_card_token #, :card_type, :card_expires_on, :card_number, :card_verification

  validates_presence_of :amount, :kind #, :card_type, :card_expires_on, :card_number, :card_verification

  # TODO: Make Payment functionality more user friendly, allowing users to pick which courses they will pay for
  # TODO: Make Payment method (Stripe or ActiveMerchant) a configurable option (default: Stripe)

  #after_create :update_subscription

  ### Some Utitlity methods

  # This is for calculating for credit-card charge.
  # For showing total in the views, check out the payment helper
  def calculate_cost(unpaid)
    #@exchange = BigDecimal.new(EXCHANGE_RATE)
    @amount_in_pesos = BigDecimal.new(unpaid.size) * COURSE_COST
    @amount_in_cents = (@amount_in_pesos.div(EXCHANGE_RATE, 10).round(2) * 100).to_i
    @amount_in_cents = @amount
    @amount
  end

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(amount: amount, description: "Charge for #{current_user.email}", card: stripe_card_token, currency: "usd")
      #customer = Stripe::Customer.create(email: current_user.email, description: "Payment made by #{current_user.full_name}(id number #{current_user.id})", card: stripe_card_token)
      #self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

private

  def update_subscription
    @unpaid_subs = Subscription.where(:user_id => @payment.user_id).unpaid
    @unpaid_subs.payment_id = @payment.id
    @unpaid_subs.activate
    @unpaid_subs.save
  end

end
