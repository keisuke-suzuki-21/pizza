class Admin::MainmenusController < Admin::Base
  def index
    @mainmenus = Mainmenu.all
    @mainmenu = Mainmenu.new
  end

  def show
    @mainmenu = Mainmenu.find(params[:id])
  end

  def create
    @mainmenu = Mainmenu.new(params[:mainmenu])
    if @mainmenu.save
      redirect_to :admin_mainmenus, notice: "メインメニューを追加しました。"
    else
      render "new"
    end
  end

  def destroy
    @mainmenu = Mainmenu.find(params[:id])
    @mainmenu.destroy
    redirect_to :admin_mainmenus, notice: "メインメニューを削除しました。"
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
end
