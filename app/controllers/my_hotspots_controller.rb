class MyHotspotsController < ApplicationController
  def dashboard
    if !current_user
      redirect_to root_url, :alert => "You must log in to do that."
    elsif !user_content_manager? && !user_admin?
      redirect_to cm_application_url, :alert => "You must become a content manager first."
    else
      @hotspots = Location.find(:all, :conditions => { :owner => current_user.id})
    end
  end
end
