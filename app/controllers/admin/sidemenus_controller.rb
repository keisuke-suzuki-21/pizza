class Admin::SidemenusController < Admin::Base
  def index
    @sidemenus = Sidemenu.all
    @sidemenu = Sidemenu.new
  end

  def show
    @sidemenu = Sidemenu.find(params[:id])
  end

  def create
    @sidemenu = Sidemenu.new(params[:sidemenu])
    if @sidemenu.save
      redirect_to :admin_sidemenus, notice: "サイドメニューを追加しました。"
    else
      render "index"
    end
  end

  def destroy
    @sidemenu = Sidemenu.find(params[:id])
    @sidemenu.destroy
    redirect_to :admin_sidemenus, notice: "サイドメニューを削除しました。"
  end
end
