class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :selectitem, only: [:show, :edit, :update, :destroy]

  # ログインしていなければ指定ページにとべない
  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if current_user.id != @item.user_id
    @item.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :value, :condition_id, :category_id, :postage_id, :prefecture_id,
                                 :shipment_day_id).merge(user_id: current_user.id)
  end

  def selectitem
    @item = Item.find(params[:id])
  end
end
