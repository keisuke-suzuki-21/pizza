class SidemenusController < ApplicationController
  def index
    @sidemenus = Sidemenu.all
    @sidemenu = Sidemenu.new
  end

  def show
    @sidemenu = Sidemenu.find(params[:id])
  end

  def new
    # @sidemenu = Sidemenu.new
  end

  def edit
    if params[:order_id]
      @order = Order.find(params[:order_id])
      @sidemenu = Sidemenu.find(params[:id])
      if @sidemenu.stock < 1
        redirect_to sidemenu_path(@sidemenu), notice: "在庫切れです。"
      else
        @sidemenu.save
        @order.sidemenus << @sidemenu
        redirect_to order_path(@order)
      end
    else
      @product = Product.find(params[:id])
    end
  end

  def create
    @sidemenu = Sidemenu.new(params[:sidemenu])
    if @sidemenu.save
      redirect_to :sidemenus, notice: "サイドメニューを追加しました。"
    else
      render "new"
    end
  end

  def update
    def update
      @sidemenu = Sidemenu.find(params[:id])
      @sidemenu.assign_attributes(params[:sidemenu])
      if @sidemenu.save
        redirect_to :sidemenus, notice: "サイドメニュー情報を更新しました。"
      else
        render "edit"
      end
    end
  end

  def destroy
    if current_member
      @order = Order.find_by(member_id: current_member.id, cart: false)
    else
      @order = Order.find_by(member_id: 100, cart: false)
    end
    @sidemenu = @order.sidemenus.find(params[:id])
    @order.sidemenus.destroy(@sidemenu)
    redirect_to order_path(@order)
  end

  def search
    @sidemenus = Sidemenu.search(params[:q])
    render "index"
  end

end
