class ConnectionsController < ApplicationController

  def create
    @connection = current_user.connections.build(:contact_id => params[:contact_id])
    if @connection.save
      flash[:notice] = "Added contact."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add contact."
      redirect_to root_url
    end
  end

  def destroy
    @connection = current_user.connections.find(params[:id])
    @connection.destroy
    flash[:notice] = "Removed contact."
    redirect_to root_url
  end
end
