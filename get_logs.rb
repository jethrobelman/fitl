require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here - from twilio.com/user/account
account_sid = 'ACb41b0b300146907903e9da9cdd29131a'
auth_token = 'cca2aaced3a23504c0fc7f20195a6cb1'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

calls = client.account.calls.list

begin
    calls.each do |call|
        puts call.sid + "\t" + call.from + "\t" + call.to
    end
    calls = calls.next_page
end while not calls.empty?