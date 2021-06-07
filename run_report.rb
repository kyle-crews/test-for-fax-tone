# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'pry'

class Report   
   
    def self.pull_results(call_sid)

        # Find your Account SID and Auth Token at twilio.com/console ... add to the strings below
        account_sid = ''
        auth_token = ''

        # initiates the connection to Twilio
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        call = @client.calls(call_sid).fetch

        puts '----------------------------------'
        puts '|  phone number  |  type of call  |'
        puts '----------------------------------'
        puts '| ' + call.to + '   | ' + "This is a #{call.answered_by}" + '  |'

    end

    self.pull_results('{call_sid}')

end
