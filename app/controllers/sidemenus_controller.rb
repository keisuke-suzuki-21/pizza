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
    # @sidemenu = Sidemenu.find(params[:id])
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
    @sidemenu = Sidemenu.find(params[:id])
    @sidemenu.destroy
    redirect_to :sidemenus, notice: "サイドメニューを削除しました。"
  end
end
