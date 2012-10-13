class FlipPaymentSubscriptionAssociation < ActiveRecord::Migration

  def change
    remove_column :payments, :subscription_id
    add_column :subscriptions, :payment_id, :integer
    add_index :subscriptions, :payment_id
    add_index :payments, :completed_at

    change_column_default(:subscriptions, :state, 'pending')
  end

end
