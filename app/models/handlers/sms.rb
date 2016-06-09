module Handlers
  class SMS < Base
    setting :phone_number
    setting :message

    def call
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      client.account.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: phone_number,
        body: message
      )
    end
  end
end
