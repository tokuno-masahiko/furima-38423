class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  before_action :move_to_index, only: :edit

  before_action :set_tweet, only: [:edit, :show]

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

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def edit
  end

  def update
    @item = Item.find(params[:id])
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

  def move_to_index
    item = Item.find(params[:id])
    unless current_user.id == item.user_id
      redirect_to action: :index
    end
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end
