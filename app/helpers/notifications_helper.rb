module NotificationsHelper
  def create_notification(user, title, message)
    notification = user.notifications.build(user_id: :user,:title => title, :message => message )
      notification.save

  end
end
