class ResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create]

  def create
    @response = Response.new(response_params)
    @response.user_id = current_user.id
    if @response.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private

  def response_params
    params.require(:response).permit(:content, :user_id, :comment_id)
  end
end
