class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show explore ]
  before_action :append_images, only: %i[create update]

  def index
    @sessions = current_user.sessions
  end

  def explore
    @sessions = Session.all
  end

  def show
  end

  def new
    @session = Session.new
  end

  def edit
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: "Session was successfully updated." }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def session_params
      params.require(:session).permit(:title, :description, :default_price_cents)
    end

    def append_images
      return if params[:session][:images].blank?
    
      params[:session][:images].each do |image|
        @session.images.attach(image)
      end
    end
end
