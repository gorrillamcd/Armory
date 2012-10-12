class Payment < ActiveRecord::Base
  belongs_to :subscription

  attr_accessible :kind

  validates_presence_of :amount, :kind
end
