module Validations
  class Email
    include ActiveModel::Validations

    attr_accessor :to, :to_name, :from, :from_name, :subject, :body

    validates :to, presence: true
    validates :to_name, presence: true
    validates :from, presence: true
    validates :from_name, presence: true
    validates :subject, presence: true
    validates :body, presence: true

    def initialize(params = {})
      @to = params[:to]
      @to_name = params[:to_name]
      @from = params[:from]
      @from_name = params[:from_name]
      @subject = params[:subject]
      @body = params[:body]
      params.require(:email)
            .permit(:to, :to_name, :from, :from_name, :subject, :body)
    end
  end
end
