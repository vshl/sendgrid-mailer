module Helper
  class Sendgrid
    attr_reader :request_body, :uri

    def initialize(params)
      @request_body = {
        "personalizations":
        [{ "to": [{ "email": "#{params[:to_name]} <#{params[:to]}>" }] }],
        "from": { "email": "#{params[:from_name]} <#{params[:from]}>" },
        "subject": params[:subject],
        "content": [{ "type": 'text/plain', "value": params[:body] }]
      }
      @uri = 'https://api.sendgrid.com/v3/mail/send'
    end

    def send
      RestClient.post(uri, request_body.to_json, headers)
    end

    private

    def headers
      { 'Authorization' => "Bearer #{ENV['SENDGRID_API_KEY']}",
        'Content-Type' => 'application/json' }
    end
  end
end
