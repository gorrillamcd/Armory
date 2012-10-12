class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :subscription
      t.integer :amount
      t.string :kind
      t.datetime :completed_at

      t.timestamps
    end
  end
end
