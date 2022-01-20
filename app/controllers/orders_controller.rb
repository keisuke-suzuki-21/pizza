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
    if current_member
      point = @order.point
      @member = Member.find(@order.member.id)
      if point.present?
        if @member.point >= point
          if point >= 0
            @member.point = @member.point - point
            @member.save
          else
            flash[:notice] = "利用ポイントに負の数は使用できない。"
            render "edit"
          end
        else
          flash[:notice] = "利用ポイントが保持ポイントを上回っています。"
          render "edit"
        end
      else
        flash[:notice] = "利用ポイントを入力してください（利用しない場合は０を入力してください）。"
        render "edit"
      end
    end
    if @order.save
    else
      render "edit"
    end
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
        @topping.stock = @topping.stock - (1 * product.number)
        @topping.save
      end
    end
    #在庫管理(topping自体)
    @order.products.each do |product|
      product.toppings.each do |topping|
        @topping = Topping.find(topping.id)
        @topping.stock = @topping.stock - (1 * product.number)
        @topping.save
      end
    end
    #サイドメニューの在庫管理
    @order.sidemenus.each do |sidemenu|
      @order.order_sidemenus.each do |order_sidemenu|
        if sidemenu.id == order_sidemenu.sidemenu_id
          @number = order_sidemenu.number
        end
      end
      price = price + sidemenu.price * @number
      @sidemenu = Sidemenu.find(sidemenu.id)
      @sidemenu.stock = @sidemenu.stock - 1 * @number
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
