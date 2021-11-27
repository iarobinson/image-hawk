class Sessions::ChargesController < ApplicationController
  before_action :set_session
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def buy
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  def index
    @charges = Charge.all
  end

  def new
    @charge = Charge.new
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  def create
    session = Stripe::Checkout::Session.create({
      line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: 'T-shirt',
            },
            unit_amount: 3000,
          },
          quantity: 1,
        }],
      mode: 'payment',
      success_url: charge_params["success_url"],
      cancel_url: charge_params["cancel_url"],
    })

    redirect_to session.url
  end

  private

    def set_session
      @session = Session.find(params[:session_id])
    end

    def charge_params
      params.require(:charge).permit(:controller, :cancel_url, :authenticity_token, :success_url)
    end

    def huh
      session = Stripe::Checkout::Session.create({
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: 'T-shirt',
            },
            unit_amount: 2000,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: 'http://localhost:4242/success.html',
        cancel_url: 'http://localhost:4242/cancel.html',
      })

      redirect session.url, 303
    end
end
