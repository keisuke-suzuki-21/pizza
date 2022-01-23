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
    price = params[:price]
    search = params[:search]
    if search == "メインメニュー"
      @mainmenus = Mainmenu.all
      if price.present?
        from = price.to_i
        to = price.to_i + 200
        @mainmenus = @mainmenus.where(price: from..to)
      end
    elsif search == "サイドメニュー"
      @sidemenus = Sidemenu.all
      if price.present?
        from = price.to_i
        to = price.to_i + 200
        @sidemenus = @sidemenus.where(price: from..to)
      end
    else
      @mainmenus = Mainmenu.all
      @sidemenus = Sidemenu.all
      if price.present?
        from = price.to_i
        to = price.to_i + 200
        @mainmenus = @mainmenus.where(price: from..to)
        @sidemenus = @sidemenus.where(price: from..to)
      end
    end
    render "index"
  end

end
