class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def edit
  end

  def show
  end

  private
    def set_user
      @user = User.friendly.find(params[:id])
    end
end
