class EmailController < ApplicationController
  def index; end

  def create
    render json: params
  end
end
