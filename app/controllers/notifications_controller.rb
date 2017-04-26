class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :destroy]

  def new
  end

  def show
    @message = @notification.message
  end

  def create
    @user = User.find(params[:user_id])
    @notification = @user.notifications.build(notification_params)
    respond_to do |format|
      if @notification.save
        format.html { flash[:notice] = "Added notification." }

      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'Notification removed' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.permit(:user_id, :title, :message)
    end
end
