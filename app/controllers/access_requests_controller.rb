class AccessRequestsController < ApplicationController
  before_action :set_access_request, only: [:show, :edit, :update, :destroy]
    
  # GET /access_requests/new
  def new
	if user_content_manager? || user_admin?
      redirect_to root_url, :alert => "You already have content manager privileges"
    end
    @access_request = AccessRequest.new
  end
  
  def approve
    if !user_admin?
      redirect_to root_url, :alert => "You must be a content manager to do that."
    end
    request = AccessRequest.find(params[:id])
    user = User.find(request.user)
    user.role = 1
    user.save
    UserMailer.approve_email(user).deliver
    redirect_to users_url, notice: 'Request Approved.'
    request.destroy
  end

  # POST /access_requests
  # POST /access_requests.json
  def create
    @access_request = AccessRequest.new(access_request_params)
    @access_request.user = current_user.id
    respond_to do |format|
      if @access_request.save
        format.html { redirect_to root_url, notice: 'Access request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @access_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_requests/1
  # PATCH/PUT /access_requests/1.json
  def update
    if !user_admin?
      redirect_to root_url, :alert => "You must be a content manager to do that."
    end
    respond_to do |format|
      if @access_request.update(access_request_params)
        format.html { redirect_to @access_request, notice: 'Access request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_requests/1
  # DELETE /access_requests/1.json
  def destroy
    if !user_admin?
      redirect_to root_url, :alert => "You must be a content manager to do that."
    end
    @access_request.destroy
    user = User.find(@access_request.user)
    UserMailer.deny_email(user).deliver
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_request
      @access_request = AccessRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_request_params
      params.require(:access_request).permit(:user, :reason, :approved, :denied)
    end
end
