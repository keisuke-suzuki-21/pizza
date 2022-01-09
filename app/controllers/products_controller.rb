class ProductsController < ApplicationController

  def show
    @mainmenu = Mainmenu.find(params[:mainmenu_id])
    # @product = Product.find_by(mainmenu_id: @mainmenu.id, id: params[:id])
    @product = Product.find(params[:id])
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
  def edit
    @mainmenu = Mainmenu.find(params[:mainmenu_id])
    @product = Product.find_by(mainmenu_id: @mainmenu.id, id: params[:id])
  end
end
