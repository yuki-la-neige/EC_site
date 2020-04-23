class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
  end

  private
  def items_params
    params.require(:item).permit(:name, :description, :price, :image, :status, :genre_id)
  end
end
