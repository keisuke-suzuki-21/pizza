class ApplicationController < ActionController::Base

  private def current_member
    Member.find_by(id: cookies.signed[:member_id]) if cookies.signed[:member_id]
  end
  helper_method :current_member

  private def current_administrator
    Administrator.find_by(id: cookies.signed[:administrator_id]) if cookies.signed[:administrator_id]
  end
  helper_method :current_administrator
  
end
