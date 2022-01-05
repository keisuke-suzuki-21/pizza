class Admin::SessionsController < Admin::Base

  def edit
  end

  def create
    administrator = Administrator.find_by(name: params[:name])
    if administrator&.authenticate(params[:password])
      #session[:member_id] = member.id
      cookies.signed[:administrator_id] = { value: administrator.id, expires: 5.minutes.from_now }
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to admin_root_path
  end

  def destroy
    #session.delete(:member_id)
    cookies.delete(:administrator_id)
    redirect_to admin_root_path
  end
end
