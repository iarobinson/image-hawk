class ChargesController < ApplicationController
  before_action :set_charge, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[index, update]

  def index
    @charges_buys = Charge.where(purchaser_id: current_user.id)
    @charges_sales = Charge.where(seller_id: current_user.id)
  end

  def show
  end

  def new
    @charge = Charge.new
  end

  def edit
  end

  def create
    @charge = Charge.new(charge_params)

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: "Charge was successfully created." }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: "Charge was successfully updated." }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
        format.html { redirect_to charges_url, notice: "We don't delete the charges." }
        format.json { head :no_content }
    end
    # @charge.destroy
    # respond_to do |format|
    #   format.html { redirect_to charges_url, notice: "Charge was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit(:success_url, :cancel_url)
    end
end
