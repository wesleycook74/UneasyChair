class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]

  def new
    @track = Track.find(params[:track_id])
    @request = Request.new
    @contacts = current_user.contacts
  end

  def show
    @track = @request.track
    @sender = @request.user.username
    @role = @request.role
    @trackname = @track.name
    @conference = Conference.find(@track.conference)
  end

  def create

    #@user = current_user
    #@request = Request.new(request_params)
    #@track = Track.find(params[:track_id])
    @request = current_user.requests.build(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to root_url, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    flash[:notice] = "Removed contact."
    redirect_to root_url
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
