class User < ActiveRecord::Base
    
    attr_accessor :stripeToken
    
    require "stripe"
    Stripe.api_key = "sk_test_gZzKQambAXAB8mykCdL2s9C2"
    
    def make_charge
        Stripe::Charge.create(
          :amount => 4000,
          :currency => "usd",
          :source => stripeToken, # obtained with Stripe.js
          :description => "Charge for test@example.com"
        )
        
    rescue Stripe::CardError => e
    end
    
end
