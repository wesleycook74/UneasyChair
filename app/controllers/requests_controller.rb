class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]

  def new
    @track = params[:track_id]

    if !@track.nil?
      @track = Track.find(params[:track_id])
      current_user_role = UserRole.where(track_id: @track.id, user_id: current_user.id).first

      @request = Request.new
      @contacts = current_user.contacts
    else
      @admin = User.find(params[:receiver_id])
      @admin = @admin.id
      @request = Request.new
    end
  end

  def show
    if !@request.track.nil?
      @track = @request.track
      @sender = @request.user.username
      @role = @request.role
      @trackname = @track.name
      @conference = Conference.find(@track.conference)
    end
  end

  def create
    @request = current_user.requests.build(request_params)
    @track_id = request_params[:track_id]
    if !@track_id.nil?
      @receiver_id = request_params[:receiver_id]
      if UserRole.exists?(track_id: @track_id, user_id: @receiver_id)
          respond_to do |format|
            format.html { redirect_to "/tracks/"+@track_id, :flash => { :error => "User already exists in this track" } }
          end
      end
    end
        respond_to do |format|
          if @request.save
            format.html { redirect_to root_url, :flash => {success: 'Request was sent succesfully.'} }
            format.json { render :show, status: :created, location: @request }
          else
            format.html { render :new }
            format.json { render json: @request.errors, status: :unprocessable_entity }
          end
        end
  end


  def destroy
    @request.destroy
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'Request was successfully destroyed.' }
    end
  end

  def set_chairable
    @request = Request.find(params[:id])
    @user = User.find(@request.user_id)
    @user.update_attribute :chairable, true
    @request.destroy

    respond_to do |format|
        format.html { redirect_to root_url, notice: 'User now chairable.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:role, :receiver_id, :track_id)
    end

end
