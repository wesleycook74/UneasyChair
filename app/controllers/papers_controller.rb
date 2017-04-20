class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_user_role, only: [:show]
  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @track = Track.find(@paper.track_id)

    @chair_id = @track.conference.user_id
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create

    @user = current_user
    @track = Track.find(params[:track_id])
    @paper = @track.papers.build(paper_params.merge(:user_id =>@user.id))

    respond_to do |format|
      if @paper.save
        format.html { redirect_to track_path(@paper.track.id), notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update

    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:title, :abstract, :attachment, :author, :track_id, :accepted)
    end

    def average_score
      @total = 0;
      @paper.reviews.each do |review|
        @total = @total + 1
      end
    end

    def get_user_role
      @track = Track.find(@paper.track_id)
      @conference = @track.conference
      if user_signed_in?
        if UserRole.exists?(track_id: @track.id, user_id: current_user.id )
          @current_user_role = UserRole.where(track_id: @track.id, user_id: current_user.id ).first.role
        elsif current_user.id == @conference.user_id
          @current_user_role = "Chair"
        end
      end
    end
end
