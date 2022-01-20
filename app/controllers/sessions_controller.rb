class SessionsController < ApplicationController

  def edit
  end

  def create
    member = Member.find_by(name: params[:name])
    if member&.authenticate(params[:password])
      #session[:member_id] = member.id
      cookies.signed[:member_id] = { value: member.id, expires: 60.minutes.from_now }
      redirect_to :root
    else
      flash.alert = "名前とパスワードが一致しません"
      render "edit"
    end
  end

  def destroy
    #session.delete(:member_id)
    cookies.delete(:member_id)
    redirect_to :root
  end
end
