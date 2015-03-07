require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here - from twilio.com/user/account
account_sid = 'AC7c636a18ae2e0cadbcfe6d44a81b1140'
auth_token = '636139126b107b11c440f2549a65c498'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

calls = client.account.calls.list

begin
    calls.each do |call|
        puts call.sid + "\t" + call.from + "\t" + call.to
    end
    calls = calls.next_page
end while not calls.empty?