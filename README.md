# README

## Ruby on Rails Email API using SendGrid

### Requirements

* Ruby version: 2.5.5

rbenv or similar ruby environment management tool

`rbenv install 2.5.5`

* Rails version: 5.1.7

`gem install rails -v 5.1.7`

### Setup

```
gem install bundler -v 2.0.2

# cd to root directory
cd mailer/

bundle install
```

### HTTP Request

* `/email` POST

**Steps**:

*1. JSON* input:

```
{
    "to": "to@mail.com",
    "to_name": "Recipient",
    "from": "from@mail.com",
    "from_name": "Sender",
    "subject": "BrightWheel Email API test",
    "body": "<h1>Dear World</h><br><p>Hello</p>"
}
```

2. API Key. See attachment

    Download attachment and move file to root directory of project

    Source the environment file for the API key

    `source ./sendgrid.env`

    Start the rails server

    `bundle exec rails s`

3. Send a POST request using a HTTP client with the JSON body

    http://localhost:3000/email

    **Header**: Content-Type => 'application/json'

### NOTES

* Made use of the rest-client gem to execute the POST request. The Reason was I was
  familiar with the gem and it is well-documented and easy to use.
* With more time, I would have added simple unit testing to test the Helper
  class and the Controller
* HTML to plain text is achieved using Nokogiri::HTML class. In rails, I have
  used it in the past. With more time I could research a more elegant solution.
* Validations currently checks for presence of the parameter and a nil check.
  This could be expanded to check format of the email
* API supports a single email address, this could further expanded to support
  multiple email addresses. Requires building the list of email addresses.
