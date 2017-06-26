class ChargesController < ApplicationController
  before_action :amount_to_be_charged

  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def amount_to_be_charged
      current_order = Order.find(session[:order_id])
      @amount = current_order.subtotal * 100
    end


end
