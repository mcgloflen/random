class Subscriber < ActiveRecord::Base
    attr_accessor :stripeToken

    def save_with_payment
      if valid?
        charge = Stripe::Charge.create(
            :amount => 1000, # amount in cents, again
            :currency => "usd",
            :source => stripeToken,
            :description => "Example charge"
          )
      end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
end
