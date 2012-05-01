class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
    	t.references :course
    	t.references :user
    	t.string :state
    	t.timestamps
    end
  end
end
