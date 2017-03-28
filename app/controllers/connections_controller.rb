class ConnectionsController < ApplicationController

  def create
    @connection = current_user.connections.build(:contact_id => params[:contact_id])
    if @connection.save
      flash[:notice] = "Added connection."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end
end
