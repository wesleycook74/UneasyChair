class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def show
  end

  def create

    #@user = current_user
    #@request = Request.new(request_params)
    @request = current_user.requests.build(:receiver_id => params[:receiver_id])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
end
