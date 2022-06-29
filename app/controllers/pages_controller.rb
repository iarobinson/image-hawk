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
      @past_sessions = the_last_10_sessions
    end
    @sessions = the_last_10_sessions
  end

  def about
  end

  def attributions
  end

  def the_last_10_sessions
    Session.limit(10).order(created_at: :desc)
  end
end
