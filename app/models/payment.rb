class Payment < ActiveRecord::Base
  has_many :subscriptions
  belongs_to :user

  attr_accessor :stripe_card_token

  attr_accessible :kind, :stripe_card_token

  validates_presence_of :kind, :stripe_card_token

  # TODO: Make Payment functionality more user friendly, allowing users to pick which courses they will pay for
  # TODO: Make Payment method (Stripe or ActiveMerchant) a configurable option (default: Stripe)

  after_create :update_subscription

  ### Some Utitlity methods

  def determine_kind
    if self.stripe_card_token
      "credit"
    else
      "deposit"
    end
  end


  def charge_and_save
    if valid? # TODO: Create a customer instead of charge for reuse of card details in future
      charge = Stripe::Charge.create(amount: amount, description: "Charge for #{email}", card: stripe_card_token, currency: "usd") # TODO: require name as well for card
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, t('ui.payments.stripe.card_error')
    false
  end

private

  def update_subscription
    @unpaid_subs = Subscription.where(:user_id => self.user_id).unpaid
    @unpaid_subs.each do |sub|
      sub.payment_id = self.id
      sub.start
      sub.save
    end
  end

end
