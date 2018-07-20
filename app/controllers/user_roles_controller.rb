class UserRolesController < ApplicationController
  before_action :set_user_role, only: [:edit, :update, :destroy]
  include NotificationsHelper

  # GET /user_roles/new
  def new
    @track = Track.find(params[:track_id])
    @user_role = UserRole.new
  end

  # GET /user_roles/1/edit
  def edit
    set_track
  end

  # POST /user_roles
  # POST /user_roles.json
  def create
    @user = current_user
    @track = Track.find(params[:track_id])
    @request = Request.find(params[:request_id])
    # To prevent duplicate users in a single track
    if UserRole.exists?(track_id: @track.id, user_id: @user.id)
      @request.destroy
      respond_to do |format|
        format.html { redirect_to current_user, :flash => { :error => "You already have a role in that track" }}
      end
    else
      @user_role = @track.user_roles.build(user_role_params.merge(:user_id => @user.id))

      set_track
      respond_to do |format|
        if @user_role.save
          format.html { redirect_to @track, :flash => { :success => "Joined Track Successfully" } }
          format.json { render :show, status: :created, location: @user_role }
          create_notification(@request.user, "#{@request.receiver.username} accepted your request", "
          #{@request.receiver.name} joined #{@track.name} as a #{@user_role.role}")
          @request.destroy
        else
          format.html { render :new }
          format.json { render json: @user_role.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /user_roles/1
  # PATCH/PUT /user_roles/1.json
  def update
    set_track
    respond_to do |format|
      if @user_role.update(user_role_params)
        format.html { redirect_to @track, notice: 'User role was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_role }
      else
        format.html { render :edit }
        format.json { render json: @user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_roles/1
  # DELETE /user_roles/1.json
  def destroy
    set_track
    @user_role.destroy
    respond_to do |format|
      format.html { redirect_to @track, :flash => {success: 'User role was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role
      @user_role = UserRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_params
      params.require(:user_role).permit(:role, :user_id)
    end

    def set_track
      @track = @user_role.track
    end

end
