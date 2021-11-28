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
    @charge = Charge.new(charge_params)

    if @charge.save
      the_root_url = URI.join(root_url).to_s.chomp('/')
      @charge.success_url = the_root_url + session_charge_path(@session, @charge)
      @charge.cancel_url = the_root_url + session_path(@session)

      stripe_session = Stripe::Checkout::Session.create({
        line_items: [{
           price_data: {
             currency: 'usd',
             product_data: {
               name: "Download the high resolution photo",
             },
             unit_amount: @session.default_price_cents,
           },
           quantity: 1,
        }],
        mode: 'payment',
        success_url: @charge.success_url,
        cancel_url: @charge.cancel_url,
      })
      redirect_to stripe_session.url
    else
      redirect_to @session, notice: "Sorry, something went wrong."
    end
  end

  private

    def set_session
      @session = Session.find(params[:session_id])
    end

    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit()
    end
end
