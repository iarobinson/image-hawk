class ChargesController < ApplicationController

  def buy
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  private

    def carge_params
      params.require(:charge).permit(:title, :description, :user, images: [])
    end
end
