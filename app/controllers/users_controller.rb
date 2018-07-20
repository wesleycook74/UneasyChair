class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :show_joined, :edit, :update, :destroy, :set_user_role]
  #before_action :set_user_roles, only: [:show, :show_joined, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_user_roles

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @user_roles = @user.user_roles
    @date = @user.created_at
    @date.strftime("%B %d, %Y")
    @date = @date.strftime("%B %Y")

    @affil = @user.affiliation.to_s
    if @affil.empty?
      @affil = "No Affiliation"
    else
      @affil = @user.affiliation
    end
  end

  def show_joined
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_owned
    @admin = User.find_by_username('admin')
    @admin = @admin.id
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_contribute
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_contact
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def search
    @users = User.where("username LIKE '%#{params[:query]}%'")
    if user_signed_in?
      @users = @users.where.not(id: current_user.id)
    end
    @users = @users.where.not(username: "admin")
  end

  def set_user_role
    @track = Track.find(params[:track_id])
    @role = UserRole.find_by(user_id: @user.id, track_id: @track.id)
    session[:user_role] = @role.role
    redirect_to @track
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if user_signed_in?
        @user = current_user
      end
    end

    def set_user_roles
      if user_signed_in?
        @user_roles = @user.user_roles
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :affiliation, :profpic)
    end
end
