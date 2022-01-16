class OrdersController < ApplicationController

  def index
    @member = Member.find(params[:member_id])
    @orders = Order.all.where(member_id: @member.id).where(case: 1)
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
    price = 0 #最終金額
    @order = Order.find(params[:id])
    @order.cart = 1 #ここでカートから注文表へと切り替える
    @order.assign_attributes(params[:order])
    #在庫管理(mainmenu)
    @order.products.each do |product|
      price = price + product.price
      mainmenu = product.mainmenu
      recipe = mainmenu.recipe
      recipe.toppings.each do |topping|
        @topping = Topping.find(topping.id)
        @topping.stock = @topping.stock - 1
        @topping.save
      end
    end
    #在庫管理(topping自体)
    @order.products.each do |product|
      product.toppings.each do |topping|
        @topping = Topping.find(topping.id)
        @topping.stock = @topping.stock - 1
        @topping.save
      end
    end
    #サイドメニューの在庫管理
    @order.sidemenus.each do |sidemenu|
      price = price + sidemenu.price
      @sidemenu = Sidemenu.find(sidemenu.id)
      @sidemenu.stock = @sidemenu.stock - 1
      @sidemenu.save
    end
    @order.price = price
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
