class SubscribersController < ApplicationController

    def create
        @subscriber = Post.find(params[:post_id]).subscribers.create(subscriber_params)
        charge_error = nil
        
        if @subscriber.valid?
            begin
              charge = Stripe::Charge.create(
                :source => params[:stripeToken],
                :amount => 100,
                :description => 'Rails Stripe customer',
                :currency => 'usd'
              )
            rescue Stripe::CardError => e
              # The card has been declined
            end
            if charge_error
              flash[:error] = charge_error
              render "/"
            else
              @subscriber.save
              @subscriber.send_message
              @subscriber.send_message_two
              redirect_to "/"
            end
        else
            redirect_to "/"
            flash[:error] = "Invalid phone number. Payment not processed. Please try again!"
        end
        
    end

private
    def subscriber_params
        params.require(:subscriber).permit(:phone, :post_id)
    end
end
