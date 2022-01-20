class TopController < ApplicationController
  def index
    @mainmenus = Mainmenu.where(recommend: 1)
    @sidemenus = Sidemenu.where(recommend: 1)
  end
end
