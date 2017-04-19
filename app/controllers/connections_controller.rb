class ConnectionsController < ApplicationController

  def create
    
    if !Connection.exists?(user_id: current_user.id, contact_id: params[:contact_id])
      @connection = current_user.connections.build(:contact_id => params[:contact_id])
      @connection.save
      flash[:success] = "Added contact."
      redirect_to root_url
    else
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
