class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @owner = User.find(@location.owner)
    @user_uploaded_images = Photo.find(:all, :conditions => { :denied => false, :approved => true, :location_id => @location.id})
    @new_image = Photo.new
  end

  # GET /locations/new
  def new
    if !user_content_manager? && !user_admin?
      redirect_to root_url, :alert => "You must be a content manager to do that."
    end
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    location = Location.find(params[:id])
    if !current_user
      redirect_to root_url, :alert => "You must log in to do that."
    elsif current_user.id != location.owner.to_i
      if !user_admin?
        redirect_to root_url, :alert => "Permission Denied."
      end
    end
  end

  # POST /locations
  # POST /locations.json
  def create
    if !user_content_manager? && !user_admin?
      redirect_to root_url, :alert => "You must be a content manager to do that."
    else
      @location = Location.new(location_params)
      @location.owner = current_user.id
      respond_to do |format|
        if @location.save
          format.html { redirect_to dashboard_url, notice: 'Location was successfully created.' }
          format.json { render action: 'show', status: :created, location: @location }
        else
          format.html { render action: 'new' }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    location = Location.find(params[:id])
    if !current_user
      redirect_to root_url, :alert => "You must log in to do that."
    elsif current_user.id != location.owner.to_i
      if !user_admin?
        redirect_to root_url, :alert => "Permission Denied."
      end
    else
      respond_to do |format|
        if @location.update(location_params)
          format.html { redirect_to @location, notice: 'Location was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    location = Location.find(params[:id])
    if !current_user
      redirect_to root_url, :alert => "You must log in to do that."
    elsif current_user.id != location.owner.to_i
      if !user_admin?
        redirect_to root_url, :alert => "Permission Denied."
      end
    else
      @location.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :owner, :lat, :long, :description, :image1, :image2, :image3, :image4)
    end
end
