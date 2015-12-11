class SubscribersController < ApplicationController
    def new
        @subscriber = Subscriber.new
    end
    def create
      @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save_with_payment
        redirect_to "/subscribers/new", :notice => "Thank you for subscribing!"
      else
        render :new
      end
    end
    
private
    def subscriber_params
        params.require(:subscriber).permit(:email, :stripeToken)
    end
end
