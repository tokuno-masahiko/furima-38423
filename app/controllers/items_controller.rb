class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: :edit
  before_action :prevent_url, only: [:edit, :update, :destroy]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @item.user_id 
     @item.destroy
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id,
                                 :item_fee, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def prevent_url
    if @item.purchase != nil 
      redirect_to root_path
    end
  end
end
