# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'pry'

class Report

    # method sets column details and formatting for report
    def self.results_table_format
        
        puts '----------------------------------'
        puts '|  phone number  |  type of call  |'
        puts '----------------------------------'

    end

    # returns # called and the type of result detected (fax, phone, human, machine, etc.)
    def self.pull_results(call_sid)

        # Find your Account SID and Auth Token at twilio.com/console ... add to the strings below
        account_sid = ''
        auth_token = ''

        # initiates the connection to Twilio
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        # makes a request to the API and returns a log calls made on the account
        call = @client.calls(call_sid).fetch
        
        # outputs the number called + details on the result detected (fax, phone, human, machine, etc.)
        puts '| ' + call.to + '   | ' + "This is a #{call.answered_by}" + '  |'

    end

    # collects all call_sids for a number as an array. Runs the pull_results() method to output details
    def self.print_results

        # Find your Account SID and Auth Token at twilio.com/console
        # and set the environment variables. See http://twil.io/secure
        account_sid = ''
        auth_token = ''
        @client = Twilio::REST::Client.new(account_sid, auth_token)
    
        # creates an array
        @call_sids = []
        
        # API call to requst calls currently in the log
        calls = @client.calls.list()
        
        # iterates over each call_sids. Adding the call_sid to an array + runs the pull_results() method to output details
        calls.each do |record|
            @call_sids << record.sid
            self.pull_results(record.sid)
        end
    
    end

    # builds the report template and calls the print_results method
    def self.start_report

        self.results_table_format
        self.print_results
    end

    # initiates the start_report method
    self.start_report

end