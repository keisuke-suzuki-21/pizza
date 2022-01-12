class MainmenusController < ApplicationController
  def index
    @mainmenus = Mainmenu.all
    @sidemenus = Sidemenu.all
  end

  def show
    @mainmenu = Mainmenu.find(params[:id])
  end

  def edit
    @mainmenu = Mainmenu.find(params[:id])
  end

  def update
    @mainmenu = Mainmenu.find(params[:id])
    @mainmenu.assign_attributes(params[:mainmenu])
    if @mainmenu.save
      redirect_to :mainmenus, notice: "メインメニュー情報を更新しました。"
    else
      render "edit"
    end
  end
  # def cart
  #   #product設定
  #   @mainmenu = Mainmenu.find(params[:mainmenu])
  #   @product = Product.new
  #   @product.mainmenu = @mainmenu
  #   @product.number = 1
  #   @product.price = @product.mainmenu.price
  #   @product.save
  #
  #   #order(カート)の設定
  #   #ログイン済みの人のカート
  #   if current_member
  #     #ログイン済みでかつ既にカートを保持している時
  #     if Order.where(member_id: current_member.id).where(cart: 0).present?
  #       @order = Order.where(member_id: current_member.id).where(cart: 0)
  #       @order.products << @product
  #     #ログインはしているが初めてのカートへの追加の時
  #     else
  #       @order = Order.new
  #       @order.member_id = current_member.id
  #       @order.products << @product
  #     end
  #   #未ログインの人のカート
  #   else
  #   end
  # end
end
