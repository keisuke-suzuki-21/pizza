class OrdersController < ApplicationController

  def index
    if current_member
      @orders = Order.where(member_id: current_member.id)
      @order = @orders.where(cart: 0)
    else
      @order = Order.new
    end
  end

  def show
  end

  def new
  end

  def edit
    @member = current_member
    @order = Order.new
    # if current_member
    #   @member = current_member
    #   @order = Order.new
    # else
    #   @order = Order.new
    # end
  end

  def create
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(params[:order])
    # @member = current_member
    # @member.assign_attributes(params[:member])
    if @order.save
      redirect_to @order
    else
      render "edit"
    end
  end

  def destroy
  end

end
