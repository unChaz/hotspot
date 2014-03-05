class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @location = Location.find(rating_params[:location_id])
    @old_rating = Rating.find(:all, :conditions => {:location_id => rating_params[:location_id], :user_id => rating_params[:user_id]})
    @old_rating = @old_rating[0]
    if @old_rating
      @old_rating.set_rating rating_params[:rating]
      respond_to do |format|
        if @old_rating.save
          format.html { redirect_to @location, notice: 'Rating was successfully changed.' }
          format.json { render action: 'show', status: :created, location: @photo }
        end
      end
    else 
      @rating = Rating.new(rating_params)
      
      respond_to do |format|
        if @rating.save
          format.html { redirect_to @location, notice: 'Rating was successfully created.' }
          format.json { render action: 'show', status: :created, location: @rating }
        else
          format.html { render action: 'new' }
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:location_id, :user_id, :rating)
    end
end
