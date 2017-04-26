class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy, :add_user]
  before_action :set_user_role, only: [:show]
  before_action :authenticate_user!
  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
  end

  def add_user
    @conference = @track.conference
    raise params.inspect
    @user_role = @track.user_roles.build(track_params[:user_role])
  end

  def add_paper

  end

  def show_needs_reviewing
    @track = Track.find(params[:track_id])
    @papers = @track.papers
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_reviewed
    @track = Track.find(params[:track_id])
    @papers = @track.papers
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_accepted
    @track = Track.find(params[:track_id])
    @papers = @track.papers
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def show_users
    @track = Track.find(params[:track_id])
    @user_roles = @track.user_roles
    set_user_role
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @conference = @track.conference
    @user_roles = @track.user_roles
    @papers = @track.papers
     if @current_user_role.nil?
       render :partial => 'authorSubmitToTrack.html.erb'
     end



  end

  # GET /tracks/new
  def new
    @track = Track.new
    @conference = Conference.find(params[:conference_id])
  end

  # GET /tracks/1/edit
  def edit
    @conference = @track.conference
  end

  # POST /tracks
  # POST /tracks.json
  def create
    # @track = Track.new(track_params)
    @conference = Conference.find(params[:conference_id])
    @track = @conference.tracks.build(track_params)
    @user = current_user

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    @conference = @track.conference
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @conference, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @conference = @track.conference
    if @conference.tracks.size < 2
      respond_to do |format|
        format.html { redirect_to @conference, :flash => {error: 'Cannot remove track: Conferences must have at least 1 track.' } }
        format.json { head :no_content }
      end
    else
      @track.destroy
      @conference = @track.conference
      respond_to do |format|
        format.html { redirect_to @conference, notice: 'Track was successfully destroyed.' }
        format.json { head :no_content }
      end

    end
  end



  private

    # Assigns user_role to the currently signed user for the current track
    def set_user_role
      @conference = @track.conference
      if user_signed_in? 
        if UserRole.exists?(track_id: @track.id, user_id: current_user.id )
          @current_user_role = UserRole.where(track_id: @track.id, user_id: current_user.id ).first.role
        elsif current_user.id == @conference.user_id
          @current_user_role = "Chair"
        end
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :acronym, :conference_id, user_role_attributes: [ :user_id, :role ])
    end

end
