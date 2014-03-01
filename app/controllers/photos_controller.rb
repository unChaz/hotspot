class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  def new
    redirect_to @location, notice: 'You must select a photo to upload.'
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.denied = false
    @photo.approved = false
    @location = Location.find(@photo.location_id)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @location, notice: 'Photo was submitted for approval.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @location, status: :unprocessable_entity }
      end
    end
  end

  def approve
    photo = Photo.find(params[:id])
    if !user_admin?
      redirect_to root_url, :alert => "Permission Denied."
    else
      photo.approved = true;
      photo.save
    end
    redirect_to users_url, notice: 'Request Approved.'
  end

  def deny
    photo = Photo.find(params[:id])
    if !user_admin?
      redirect_to root_url, :alert => "Permission Denied."
    else
      photo.approved = false;
      photo.denied = true;
      photo.save
    end
    redirect_to users_url, notice: 'Request Denied.'
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:location_id, :approved, :denied, :image)
    end
end
