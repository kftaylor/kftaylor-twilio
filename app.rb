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

  if sms_body == 'summit'
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "This is filler text, change text here app.rb."
    end
  else
    twiml = Twilio::TwiML::Response.new
  end

  twiml.text
end
