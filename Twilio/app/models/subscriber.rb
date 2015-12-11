class Subscriber < ActiveRecord::Base
    validates :phone, presence: true
        
    def send_message
        # Instantiate a Twilio client
        client = Twilio::REST::Client.new(TWILIO_CONFIG['account_sid'], TWILIO_CONFIG['auth_token'])
  
        # Create and send an SMS message
        client.account.messages.create(
            from: TWILIO_CONFIG['from'],
            to: self.phone,
            body: "message one"
        )
    end
    
    def send_message_two
        # Instantiate a Twilio client
        client = Twilio::REST::Client.new(TWILIO_CONFIG['account_sid'], TWILIO_CONFIG['auth_token'])
  
        # Create and send an SMS message
        client.account.messages.create(
            from: TWILIO_CONFIG['from'],
            to: self.phone,
            body: "message two"
        )
    end

    handle_asynchronously :send_message, :run_at => Proc.new { 2.minutes.from_now }
    handle_asynchronously :send_message_two, :run_at => Proc.new { 4.minutes.from_now }
end
