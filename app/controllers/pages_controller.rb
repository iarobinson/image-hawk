class PagesController < ApplicationController
  def index
    if current_user
      @past_sessions = current_user.sessions
      @purchases = Charge.where(purchaser: current_user)
      @this_months_charge_total = 0
      @purchases.each do |purchase|
        @this_months_charge_total += purchase.price
      end
      
    else
      @past_sessions = Session.all
    end
    @sessions = Session.all
  end

  def test
    p 'the good fight'
  end

  def about
  end
end
