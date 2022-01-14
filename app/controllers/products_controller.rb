class ProductsController < ApplicationController

  #カートを表すアクション
  def index
    @order = Order.find(params[:id])
    @products = @order.products
  end

  def show
    if params[:order_id]
      @order = Order.find(params[:order_id])
      # @order = Order.where(member_id: current_member.id).where(cart: 0)
      @product = Product.find(params[:id])
      @product.save
      @order.products << @product
      Product.find(params[:id]).delete #消せてなさそう
      # redirect_to order_products_path(@order)
      redirect_to order_path(@order)
    else
      @product = Product.find(params[:id])
    end
  end

  #メインメニューのみの追加
  def new
    if Product.find_by(mainmenu_id: @mainmenu.id, id: params[:id]).present?
      @product = Product.find_by(mainmenu_id: @mainmenu.id, id: params[:id])
    else
      @product = Product.new
      @mainmenu = Mainmenu.find(params[:mainmenu_id])
      @product.mainmenu = @mainmenu
      @product.price = @product.mainmenu.price
      @product.save
    end
  end

  #トッピングありの追加
  #カートにproductを格納するアクション
  def edit
    a = 0 #ダブルリダイレクションをなくす工夫
    if params[:order_id]
      @order = Order.find(params[:order_id])
      @product = Product.find(params[:id])
      #在庫管理機能(mainmenu)
      @product.mainmenu.recipe.toppings.each do |topping|
        @topping = Topping.find(topping.id)
        if @topping.stock < 1
          a = 1
        end
      end
      #在庫管理機能(topping)
      @product.toppings.each do |topping|
        @topping = Topping.find(topping.id)
        if @topping.stock < 1
          a = 1
        end
      end
      @product.save
      @order.products << @product
      if a == 1
        redirect_to product_path(@product), notice: "在庫切れです。"
      else
        redirect_to order_path(@order)
      end
    else
      @product = Product.find(params[:id])
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(params[:product])
    if @product.save
      redirect_to @product
    else
      render "edit"
    end
  end

  def cart
    @product = Product.find(params[:product])
    if current_member && Order.where(member_id: current_member.id).where(cart: 0).present?
      @order = Order.where(member_id: current_member.id).where(cart: 0)
      @order.products << @product
      Product.find(@product.id).delete
    else
      @order = Order.new
      @order.products << @product
      Product.find(@product.id).delete
      @order.member_id = current_member.id
      @order.id = current_member.id
      @order.save!
    end
    redirect_to order_path(@order)
  end
end
