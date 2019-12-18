module Helper
  class Sendgrid
    attr_reader :mail

    def initialize(params)
      from = Email.new(email: params[:from])
      to = Email.new(email: params[:to])
      subject = params[:subject]
      content = Content.new(type: 'text/plain', value: params[:body])
      @mail = Mail.new(from, subject, to, content)
    end

    def response
      client.mail._('send').post(request_body: mail.to_json)
    end

    private

    def client
      SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client
    end
  end
end
