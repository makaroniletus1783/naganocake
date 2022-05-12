class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = params[:genre_id].present? ? Genre.find(params[:genre_id]).items : Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
