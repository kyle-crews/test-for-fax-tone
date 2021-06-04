# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

fax = @client.fax.faxes
  .create(
     from: '+15017122661',
     to: '+15558675310',
     media_url: 'https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf'
   )

puts fax.sid