class PagesController < ApplicationController
  def index
    if current_user
      @past_sessions = current_user.sessions
    else
      @past_sessions = Session.all
    end
  end
end
