class RebuttlesController < ApplicationController
  before_action :set_rebuttle, only: [:show, :edit, :update, :destroy]

  # GET /rebuttles
  # GET /rebuttles.json
  def index
    @rebuttles = Rebuttle.all
  end

  # GET /rebuttles/1
  # GET /rebuttles/1.json
  def show
  end

  # GET /rebuttles/new
  def new
    @rebuttle = Rebuttle.new
    @review = Review.find(params[:rID])
  end

  # GET /rebuttles/1/edit
  def edit
  end

  # POST /rebuttles
  # POST /rebuttles.json
  def create
    @review = Review.find(params[:rID])
    @rebuttle = Rebuttle.new(rebuttle_params)

    respond_to do |format|
      if @rebuttle.save
        format.html { redirect_to @rebuttle, notice: 'Rebuttle was successfully created.' }
        format.json { render :show, status: :created, location: @rebuttle }
      else
        format.html { render :new }
        format.json { render json: @rebuttle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rebuttles/1
  # PATCH/PUT /rebuttles/1.json
  def update
    respond_to do |format|
      if @rebuttle.update(rebuttle_params)
        format.html { redirect_to @rebuttle, notice: 'Rebuttle was successfully updated.' }
        format.json { render :show, status: :ok, location: @rebuttle }
      else
        format.html { render :edit }
        format.json { render json: @rebuttle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rebuttles/1
  # DELETE /rebuttles/1.json
  def destroy
    @rebuttle.destroy
    respond_to do |format|
      format.html { redirect_to rebuttles_url, notice: 'Rebuttle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rebuttle
      @rebuttle = Rebuttle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rebuttle_params
      params.require(:rebuttle).permit(:review_ID, :authorRebuttle)
    end
end
