class ChargesController < ApplicationController
  layout "application"

  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :description

  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_int,
      :description => @description,
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

    def description
      @description = "Sample Logistics Webshop"
    end
end
