class EmailController < ApplicationController
  def index; end

  def create
    mail = Helper::Sendgrid.new(email_params)
    render json: mail.response
  end

  private

  def email_params
    params.require(:email).permit(:to, :to_name, :from, :from_name, :subject, :body)
  end
end
