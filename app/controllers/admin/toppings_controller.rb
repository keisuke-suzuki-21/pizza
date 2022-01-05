class Admin::ToppingsController < Admin::Base
  def index
    @toppings = Topping.all
    @topping = Topping.new
  end

  def show
    @topping = Topping.find(params[:id])
  end

  def create
    @topping = Topping.new(params[:topping])
    if @topping.save
      redirect_to :admin_toppings, notice: "トッピングを追加しました。"
    else
      render "new"
    end
  end

  def destroy
    @topping = Topping.find(params[:id])
    @topping.destroy
    redirect_to :admin_toppings, notice: "トッピングを削除しました。"
  end
end
