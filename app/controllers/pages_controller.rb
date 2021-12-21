class PagesController < ApplicationController
  def index
    if current_user
      @past_sessions = current_user.sessions
      @purchases = Charge.all.where('purchaser_id': current_user.id)
    else
      @past_sessions = Session.all
    end
  end
end
