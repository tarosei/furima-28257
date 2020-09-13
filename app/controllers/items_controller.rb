class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :move_to_index, except: [:index, :show]


  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render "new"
    end
  end

  def show
    
  end


  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :carriage_id, :area_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end
  
  
end
