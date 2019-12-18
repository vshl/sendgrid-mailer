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
    render json: { error: email.errors } && return unless email.valid?
  end
end
