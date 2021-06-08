# test-for-fax-tone
Twilio script to test for a fax tone, given an array of phone numbers.

## before running the program

You'll need the following prior to running these scripts:

1. Ruby is needed to run this script... download the latest version here: https://www.ruby-lang.org/en/documentation/installation/
2. ... once that's installed, you'll also need to download the helper library from https://www.twilio.com/docs/ruby/install
3. A twilio (signup at https://twilio.com) account + activated phone number

## how to run the scripts

1. Download this repo to your local machine (https://github.com/kyle-crews/test-for-fax-tone/archive/refs/heads/main.zip)
2. Within a terminal/cli window, navigate to the project folder you downloaded. 
  
  Example: `$ cd ./Downloads/test-for-fax-tone`

3. Once inside the project directory, open the `$ run_this.rb` and `$ run_report.rb` files in an IDE.
  
  Example (if using VS Code): `$ code run_this.rb` and `$ code run_report.rb`
  
4. Update all fields needing `account_sid`, `auth_token`, `twilio_phone_number` ... and add list of numbers to `@fax_numbers` array.

  ***Please note: the Format needs to be like this: ['+18553922666', '+18507020366', '+18504314447', '+18508776674'] for the list of fax numbers added***
  
  If you're planning to upload these files to a repo on Github, it's ***highly recommended to use environmental variables***, versus strings for the `account_sid` and `auth_token`. This can be done by updating the value to:

        `account_sid = ENV['TWILIO_ACCOUNT_SID']`
        `auth_token = ENV['TWILIO_AUTH_TOKEN']`
  
5. Ensure all changes are saved to the files.
6. To start the calls/tests, ensure you're in the project directory ./test-for-fax-tone and run the command `$ ruby run_this.rb`
7. To retrieve the test results, ensure you're in the project directory ./test-for-fax-tone and run the command `$ ruby run_report.rb`

These scripts use the Answering Machine Detection service provided by Twilio. More details on this service and associated functionality can be found here: https://www.twilio.com/docs/voice/answering-machine-detection
