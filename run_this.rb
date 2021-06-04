# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.calls
  .create(
     machine_detection: 'Enable',
     url: 'https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16',
     to: '+1562300000',
     from: '+18180000000'
   )

puts call.sid