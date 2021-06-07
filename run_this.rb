# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

class Call

  def self.make_call

    # Find your Account SID and Auth Token at twilio.com/console ... add to the strings below
    account_sid = ''
    auth_token = ''

    # initiates the connection to Twilio
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    # creates a call with Answering Machine Destection enabled (https://www.twilio.com/docs/voice/answering-machine-detection)
    call = @client.calls
      .create(
        machine_detection: 'Enable',
        url: 'https://api.twilio.com/2010-04-01/Accounts/{account_sid}/Calls.json',
        to: '+18553922666',
        from: '{your_twilio_number}'
      )
    # outputs the number that was called, if request is successful
    puts 'Successfully made a call to ' + call.to

  end

  self.make_call

end