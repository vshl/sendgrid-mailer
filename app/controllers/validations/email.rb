module Validations
  class Email
    include ActiveModel::Validations

    validates :to, presence: true, allow_nil: false
    validates :to_name, presence: true, allow_nil: false
    validates :from, presence: true, allow_nil: false
    validates :from_name, presence: true, allow_nil: false
    validates :subject, presence: true, allow_nil: false
    validates :body, presence: true, allow_nil: false

    attr_accessor :to, :to_name, :from, :from_name, :subject, :body

    def initialize(params = {})
      @to = params[:to]
      @to_name = params[:to_name]
      @from = params[:from]
      @from_name = params[:from_name]
      @subject = params[:subject]
      @body = params[:body]
      params
        .require(:email)
        .permit(:to, :to_name, :from, :from_name, :subject, :body)
    end
  end
end
