class Sessions::ChargesController < ApplicationController
  before_action :set_session

  def buy
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  def create
    charge = Stripe::Charge.create({
                                     amount: 20,
                                     currency: 'usd',
                                     source: 'tok_amex',
                                     receipt_email: params[:receipt_email],
                                     description: 'My First Test Charge(created for API docs)',
                                   })
    render json: charge
  end

  private

    def set_session
      @session = Session.find(params[:session_id])
    end

    def charge_params
      params.require(:charge).permit(:title, :description, :user, images: [])
    end
end
