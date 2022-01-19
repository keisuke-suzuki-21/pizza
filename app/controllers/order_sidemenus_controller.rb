class OrderSidemenusController < ApplicationController
  def update
    @order_sidemenu = OrderSidemenu.find(params[:id])
    @order_sidemenu.assign_attributes(params[:order_sidemenu])
    @order_sidemenu.save
    if current_member
      @order = Order.find_by(member_id: current_member.id, cart: false)
    else
      @order = Order.find_by(member_id: 100, cart: false)
    end
    redirect_to @order
  end
end
