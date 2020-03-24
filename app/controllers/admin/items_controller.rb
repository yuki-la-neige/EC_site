class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
    @genres = Genre.all
  end
  def create
    @item = Item.new(items_params)
    @item.genre_id = @genre.id
    @item.save
    redirect_to root_path
  end

  private
  def items_params
    params.require(:items).permit(:name, :description, :price, :image, :status, :genre_id[])
  end
end
