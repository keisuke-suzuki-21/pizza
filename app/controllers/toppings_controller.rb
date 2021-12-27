class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
    @topping = Topping.new
  end

  def show
    @topping = Topping.find(params[:id])
  end

  def new
    # @mainmenu = Mainmenu.new
  end

  def edit
    # @mainmenu = Mainmenu.find(params[:id])
  end

  def create
    @topping = Topping.new(params[:topping])
    if @topping.save
      redirect_to :toppings, notice: "トッピングを追加しました。"
    else
      render "new"
    end
  end

  def update
    def update
      @topping = Topping.find(params[:id])
      @topping.assign_attributes(params[:topping])
      if @topping.save
        redirect_to :toppings, notice: "トッピング情報を更新しました。"
      else
        render "edit"
      end
    end
  end

  def destroy
    @topping = Topping.find(params[:id])
    @topping.destroy
    redirect_to :toppings, notice: "トッピングを削除しました。"
  end
end
