class Payment < ActiveRecord::Base
  has_many :subscriptions
  has_one :user, :through => :subscriptions

  # attr_accessor :card_type, :card_expires_on, :card_number, :card_verification

  attr_accessible :kind #, :card_type, :card_expires_on, :card_number, :card_verification

  validates_presence_of :amount, :kind #, :card_type, :card_expires_on, :card_number, :card_verification

  # TODO: Make Payment functionality more user friendly, allowing users to pick which courses they will pay for
  # TODO: Make Payment method (Stripe or ActiveMerchant) a configurable option (default: Stripe)

  after_create :update_subscription

  # Some Utitlity methods
  def payment_amount(unpaid)
    @amount = 3600
    @amount
  end

private

  def update_subscription
    @unpaid_subs = Subscription.where(:user_id => current_user.id).unpaid
    @unpaid_subs.payment_id = @payment.id
    @unpaid_subs.activate
    @unpaid_subs.save
  end

end
