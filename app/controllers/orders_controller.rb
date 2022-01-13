class OrdersController < ApplicationController

  def index
    @member = Member.find(params[:member_id])
    @orders = Order.all.where(member_id: @member.id)
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
    @order.assign_attributes(params[:order])
    # @order.save
    # render "edit"  if @order.invalid?
  end

  #確定アクション
  def complete
    @order = Order.find(params[:id])
    @order.cart = 1 #ここでカートから注文表へと切り替える
    @order.assign_attributes(params[:order])
    @order.save
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
