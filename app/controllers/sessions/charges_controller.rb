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
    successful_charge_url = Rails.root.to_s + session_charges_path(@session)
    cancel_charge_url =
    @charge = Charge.new
    @attachment = ActiveStorage::Attachment.find(params[:image])
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.success_url = "This is the link to the correct place to redirect people who have paid"
    @charge.cancel_url = session_path(@session)

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

    respond_to do |format|
      if @session.save
        redirect_to stripe_session.url
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_session
      @session = Session.find(params[:session_id])
    end

    def charge_params
      params.require(:charge).permit()
    end
end
