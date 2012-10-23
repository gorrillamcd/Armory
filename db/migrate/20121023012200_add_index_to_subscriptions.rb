class AddIndexToSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, :course_id
    add_index :subscriptions, :user_id
  end
end
