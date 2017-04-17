class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy, :add_user]

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

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @conference = @track.conference
    @user_roles = @track.user_roles
     if session[:user_role].nil? && @conference.user_id != current_user.id
       render :partial => 'authorSubmitToTrack.html.erb'
     end
  end
def authorSubmitToTrack

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
    @track.destroy
    @conference = @track.conference
    respond_to do |format|
      format.html { redirect_to @conference, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :acronym, :conference_id, user_role_attributes: [ :user_id, :role ])
    end

end
