class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.create(item_params)
      if @item.save
        redirect_to items_path
        flash[:notice] = "Item successfully added!"
      else
      render "new"
      flash[:alert] = "Sorry, you must add a valid item"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :avatar)
  end


end
