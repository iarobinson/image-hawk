class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show explore ]

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
    ensure_current_user_owns @session
  end

  def create
    @session = Session.new(session_params)
    @session['default_price_cents'] = (session_params['default_price'].to_f * 100).to_i.to_s
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
    redirect_to root_path, notice: "You can not pass." if current_user != @session.user
    @session['default_price_cents'] = (session_params['default_price_cents'].to_f * 100).to_i.to_s

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
    ensure_current_user_owns @session
    @session.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def session_params
      params.require(:session).permit(:title, :description, :default_price, images: [])
    end

    def ensure_current_user_owns session
      if current_user != session.user
        redirect_to root_path, notice: "You can not pass." and return
      end
    end
end
