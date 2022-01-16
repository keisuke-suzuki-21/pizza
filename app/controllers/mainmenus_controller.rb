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

  def search
    @mainmenus = Mainmenu.search(params[:q])
    render "index"
  end
end
