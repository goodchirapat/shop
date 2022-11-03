class MainController < ApplicationController
  before_action :must_be_logged_in, only: %i[ user_item ]
  def login
  end

  def create
    u=User.where(login:params[:login]).first
    if u && u.authenticate(params[:password])
      session[:logged_in] =true
      session[:id]= u.id
      redirect_to '/main/user_item'
    else
      redirect_to main_login_path ,notice: 'wrong info'
    end
    
  end
  def user_item
    
  end

  def destroy
  end

  def shop
    @u=User.where(id:params[:id]).first
  end

  def buy
    @item=Item.where(id:params[:item]).first
    @item.stock -= 1
    @item.save
    Inventory.create(user_id: session[:id], item_id: @item.id, price: @item.price, timestamp: DateTime.current)
    redirect_to '/shop/'+ params[:from].to_s
  end
  def show_inventory
    @u=User.where(id:session[:id]).first
  end
end
