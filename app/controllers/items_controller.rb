class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 
  before_action :move_to_index, except: [:index, :new, :create ]
  
#ログインしていなければ指定ページにとべない
  def index
    @items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:name, :text, :image, :value, :condition_id, :category_id, :postage_id, :prefecture_id, :shipment_day_id).merge(user_id: current_user.id)
  end
    
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
