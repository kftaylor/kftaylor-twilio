#encoding: utf-8

configure do
end

before do
end

get '/' do
  Twilio::VERSION.to_s
end

post '/sms' do

  sms_body = params[:Body]
  sms_body = sms_body.gsub("/[^A-Za-z0-9]/u", ' ').strip.downcase

  # sender = params[:From]
  # friends = {
  #     "+14153334444" => "Curious George",
  #     "+14158157775" => "Boots",
  #     "+14155551234" => "Virgil"
  # }
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, you sent #{sms_body}."
  end
  twiml.text
end
