class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  layout "application"

  def create
    customer = StripeTool.create_customer(email: params[:stripeEmail], stripe_token: params[:stripeToken])
    charge = StripeTool.create_charge(customer_id: customer.id, amount: @amount, description: @description)

  redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks

  end

  private
    def amount_to_be_charged
      current_order = Order.find(session[:order_id])
      @amount = current_order.subtotal * 100
    end
end
