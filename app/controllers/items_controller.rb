class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
 
  def index
  end

  def edit
    
  end

  def new
    
  end

  def show
    
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
