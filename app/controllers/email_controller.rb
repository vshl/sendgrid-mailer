class EmailController < ApplicationController
  before_action :validate_params

  def index; end

  def create
    mail = Helper::Sendgrid.new(params)
    render json: { 'message' => 'Email Sent' } if mail.send
  end

  rescue_from(ActionController::UnpermittedParameters) do |p|
    render json: { error: { unknown_parameters: p.params } },
           status: :bad_request
  end

  private

  def validate_params
    email = Validations::Email.new(params)
    return unless email.invalid?

    render json: { error: email.errors }
  end
end
