class Payment < ActiveRecord::Base
  has_many :subscriptions

  attr_accessor :card_type, :card_expires_on, :card_number, :card_verification

  attr_accessible :kind, :card_type, :card_expires_on, :card_number, :card_verification

  validates_presence_of :amount, :kind, :card_type, :card_expires_on, :card_number, :card_verification

  # TODO: Make Payment functionality more user friendly, allowing users to pick which courses they will pay for

  #### Active Merchant Payment Functionality

  # Some Utitlity methods
  def payment_amount(unpaid)
    @amount = 3600
    @amount
  end

end
