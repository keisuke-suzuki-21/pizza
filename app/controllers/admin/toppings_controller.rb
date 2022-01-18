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
      redirect_to :admin_toppings
    else
      render "index"
    end
  end

  def destroy
    @topping = Topping.find(params[:id])
    if @topping.recipes.present?
      flash[:notice] = "このトッピングはレシピに含まれているため削除できません。"
      render "show"
    else
      @topping.destroy
      redirect_to :admin_toppings, notice: "トッピングを削除しました。"
    end
  end
end
