class PagesController < ApplicationController
  def index
    if current_user
      @past_sessions = current_user.sessions
      @earnings = Charge.where({seller: current_user, payment_successful: true})
      @purchases = Charge.where({purchaser: current_user})
      @this_months_charge_total = 0
      @earnings.each do |purchase|
        @this_months_charge_total += purchase.price if purchase.payment_successful
      end
      
    else
      @past_sessions = Session.all
    end
    @sessions = Session.all
  end

  def about
  end

  def attributions
  end
end
