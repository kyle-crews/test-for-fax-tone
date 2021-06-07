# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'pry'

class Call

  # add fax numbers to array. Format needs to be like this: ['+18553922666', '+18507020366', '+18504314447', '+18508776674']
  @fax_numbers = []

  # iterates over the fax_numbers array, calling the make_call() method each pass
  def self.start

      @fax_numbers.each do |number|
          self.make_call(number)
      end

  end

  # makes a call via the API with Machine Detection enabled... outputs number called.
  def self.make_call(number)

    # Find your Account SID and Auth Token at twilio.com/console ... add to the strings below
    account_sid = ''
    auth_token = ''

    # initiates the connection to Twilio
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    # creates a call with Answering Machine Destection enabled (https://www.twilio.com/docs/voice/answering-machine-detection)
    call = @client.calls
      .create(
        machine_detection: 'Enable',
        url: 'https://api.twilio.com/2010-04-01/Accounts/{account_sid}/Calls.json', # << add your twilio account sid >>
        to: "#{number}",
        from: '{your_twilio_number}' # << add your twilio phone number >>
      )

    # outputs the number that was called, if request is successful
    puts 'Successfully made a call to ' + call.to

  end

  self.start

end