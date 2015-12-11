class AddStripeToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :stripe_customer_token, :string
  end
end
