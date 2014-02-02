class AdministrationController < ApplicationController
  def index
    if user_admin?
      @users = User.all
      @users.delete(current_user)
      @access_requests = AccessRequest.all
    else
     redirect_to root_url, :alert => "You do not have permission to view this page."
    end
  end

  def setrole
    if user_admin?
      user = User.find_by_uid params[:id]
      begin
        role = params[:role].to_i
        if role > 2 || role < 0
          redirect_to users_url, :alert => "User update failed! Role must be between 0 and 2 (given: " + role.to_s + ")"
        else
          user.set_role(role)
          user.save
          redirect_to users_url, :notice => "User updated!"
        end
      rescue
        redirect_to users_url, :alert => "User update failed!"
      end
    else
     redirect_to root_url, :alert => "You do not have permission to view this page."
    end
  end
end
