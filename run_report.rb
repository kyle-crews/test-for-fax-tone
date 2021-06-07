# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'pry'

class Report  

    def self.results_table_format
        
        puts '----------------------------------'
        puts '|  phone number  |  type of call  |'
        puts '----------------------------------'

    end

    def self.pull_results(call_sid)

        # Find your Account SID and Auth Token at twilio.com/console ... add to the strings below
        account_sid = ''
        auth_token = ''

        # initiates the connection to Twilio
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        call = @client.calls(call_sid).fetch

        puts '| ' + call.to + '   | ' + "This is a #{call.answered_by}" + '  |'

    end

    def self.print_results

        # Find your Account SID and Auth Token at twilio.com/console
        # and set the environment variables. See http://twil.io/secure
        account_sid = ''
        auth_token = ''
        @client = Twilio::REST::Client.new(account_sid, auth_token)
    
        @call_sids = []
    
        calls = @client.calls.list()
    
        calls.each do |record|
            @call_sids << record.sid
            self.pull_results(record.sid)
        end
    
    end

    def self.start_report

        self.results_table_format
        self.print_results
    end
    
    self.start_report

end