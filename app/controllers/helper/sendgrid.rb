module Helper
  class Sendgrid
    attr_reader :request_body, :uri

    def initialize(params)
      @request_body = {
        "personalizations":
        [{ "to": [{ "email": (params[:to]).to_s }] }],
        "from": { "email": (params[:from]).to_s },
        "subject": params[:subject],
        "content": [{ "type": 'text/plain', "value": Nokogiri::HTML(params[:body]).text }]
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
