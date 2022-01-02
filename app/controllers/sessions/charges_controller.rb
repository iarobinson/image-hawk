class Sessions::ChargesController < ApplicationController
  before_action :set_session
  before_action :set_charge, only: [:show, :success]
  before_action :authenticate_user!, only: [:create]

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

  def show
  end

  def success
    @charge.update(payment_successful: true)
    @attachment = ActiveStorage::Attachment.find(@charge.asset_id)
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.seller = @session.user
    @charge.purchaser = current_user
    @charge.session = @session

    if @charge.save
      the_root_url = URI.join(root_url).to_s.chomp('/')
      success_url = the_root_url + session_charge_success_path(@session, @charge)
      cancel_url = the_root_url + session_path(@session)

      @charge.update "success_url": success_url
      @charge.update "cancel_url": cancel_url

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
      @charge = Charge.find(params[:charge_id])
    end

    def charge_params
      params.require(:charge).permit(:asset_id)
    end
end
