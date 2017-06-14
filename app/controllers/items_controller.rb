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

  def show
    @item = Item.find(params[:id])
    @image_url = @item.avatar.url(:medium)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item deleted!"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :avatar)
  end


end
