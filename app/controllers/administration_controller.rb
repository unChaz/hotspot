class AdministrationController < ApplicationController
  def index
    if user_admin?
      @users = User.all
    else
     redirect_to root_url, :alert => "You do not have permission to view this page."
    end
  end

  def setrole
    user = User.find(params[:id])
    role = params[:role]
    if role > 2 || role < 0
      user.role = role
      user.save
      redirect_to root_url, :notice => "User updated!"
    else
      redirect_to root_url, :alert => "User update failed!"
    end
  end
end
