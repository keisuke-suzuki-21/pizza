class Admin::OrdersController < Admin::Base

  def index
    @orders = Order.all.where(cart: 1, case: 0)#注文表でかつ発送前のorder
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
