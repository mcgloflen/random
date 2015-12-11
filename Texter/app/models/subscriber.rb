class Subscriber < ActiveRecord::Base
    
    belongs_to :post
    
    validates :phone, 
        presence: true, 
        length: { :in => 10..11, :too_long => "That is not a valid phone number length!" }, 
        numericality: true
    
    def send_message
        # Instantiate a Twilio client
        client = Twilio::REST::Client.new(TWILIO_CONFIG['account_sid'], TWILIO_CONFIG['auth_token'])
  
        # Create and send an SMS message
        client.account.messages.create(
            from: TWILIO_CONFIG['from'],
            to: self.phone,
            body: "hello"
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
    handle_asynchronously :send_message_two, :run_at => Proc.new { 3.minutes.from_now }
end
