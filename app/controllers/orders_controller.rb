class OrdersController < ApplicationController

  def index
    #ログイン済みの人のカート
    if current_member
      #ログイン済みでかつ既にカートを保持している時
      if Order.where(member_id: current_member.id).where(cart: 0).present?
        @order = Order.where(member_id: current_member.id).where(cart: 0)
      #ログインはしているが初めてのカートへの追加の時
      else
        @order = Order.new
        @order.member_id = current_member.id
        @order.save
      end
    #未ログインの人のカート
    else
      @order = Order.new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  #確認画面用アクション
  def confirm
    @order = Order.find(params[:id])
    render "edit"  if @order.invalid?
  end

  def create
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(params[:order])
    if @order.save
      redirect_to @order
    else
      render "edit"
    end
  end

  def destroy
  end

end
