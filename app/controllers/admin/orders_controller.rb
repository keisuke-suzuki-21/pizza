class Admin::OrdersController < Admin::Base

  def index
    @orders = Order.all.where(cart: 1, case: 0)#注文表でかつ発送前のorder
  end

  def show
  end

  def new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(params[:order])
    if @order.save
      redirect_to admin_orders_path
    else
      render "edit"
    end
  end

  def destroy
  end

end
