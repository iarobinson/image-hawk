class PagesController < ApplicationController
  def index
    @past_sessions = current_user.sessions if current_user
  end
end
