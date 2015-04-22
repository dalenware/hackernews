def send_text message, from = '6194304830', to = '2148938300'
  token = ENV['TWILIO_AUTH_TOKEN']
  sid = ENV['TWILIO_ACCOUNT_SID']
  client = Twilio::REST::Client.new sid, token
  result = client.messages.create from: from, to: to, body: message
  result
end
