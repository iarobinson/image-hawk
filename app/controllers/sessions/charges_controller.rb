class Sessions::ChargesController < ApplicationController
  before_action :set_session

  def buy
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  private

    def set_session
      @session = Session.find(params[:session_id])
    end

    def charge_params
      params.require(:charge).permit(:title, :description, :user, images: [])
    end
end
