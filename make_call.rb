require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here - from twilio.com/user/account
account_sid = 'AC7c636a18ae2e0cadbcfe6d44a81b1140'
auth_token = '636139126b107b11c440f2549a65c498'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@call = @client.account.calls.create(
                                     :from => '+351308803621',   # From your Twilio number
                                     :to => '+351914212301',     # To any number
                                     # Fetch instructions from this URL when the call connects
                                     :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
                                     )