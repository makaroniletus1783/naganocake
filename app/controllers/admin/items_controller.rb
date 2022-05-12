class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render new_admin_item_path
    end
  end

  def show
  end

  def edit
  end
  
  def search
  @items = Item.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_available)
  end
end
